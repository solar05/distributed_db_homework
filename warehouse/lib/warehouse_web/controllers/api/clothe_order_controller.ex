defmodule WarehouseWeb.Api.ClotheOrderController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheOrder

  def order(conn, %{"id" => magazine_id, "clothe" => clothe_id, "employee" => employee_id}) do
    {{year, month, date}, _} = :calendar.local_time
    curr_date = Date.from_iso8601!("#{year}-#{month}-#{date}")
    {magazine, _} = Integer.parse(magazine_id)
    {employee, _} = Integer.parse(employee_id)
    {clothe, _} = Integer.parse(clothe_id)
    order = Ecto.Changeset.change(%ClotheOrder{},
    order_date: curr_date,
    employee_id: employee,
    magazine_id: magazine,
    quantity: 20,
    state: "ordered",
    clothe_id: clothe
    )
    Sales.create_order!(order)
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, "Created!")
  end

end
