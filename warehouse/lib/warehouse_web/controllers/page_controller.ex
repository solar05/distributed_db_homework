defmodule WarehouseWeb.PageController do
  use WarehouseWeb, :controller
  alias Warehouse.Sales

  def index(conn, _params) do
    IO.inspect(Confex.get_env(:warehouse, :magazine))
    clothe_in_store = Sales.list_clothe_in_store()
    render(conn, "index.html", clothe_in_store: clothe_in_store)
  end
end
