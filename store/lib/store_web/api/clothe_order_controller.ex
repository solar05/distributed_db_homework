defmodule StoreWeb.Api.ClotheOrderController do
  use StoreWeb, :controller

  alias Store.Sales
  alias Store.Sales.ClotheOrder

  def order(conn, %{"id" => magazine_id, "clothe" => clothe_id, "employee" => employee_id}) do
    {clothe, _} = Integer.parse(clothe_id)
    {magazine, _} = Integer.parse(magazine_id)
    {employee, _} = Integer.parse(employee_id)
    order = Sales.get_clothe_order!(clothe, employee, magazine)
    Sales.update_clothe_order(order, %{"state" => "delivered"})
    Sales.refill_clothe_in_store(order.clothe_id, order.quantity)
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, "Delivered!")
  end

end
