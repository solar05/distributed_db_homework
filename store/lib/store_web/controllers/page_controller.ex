defmodule StoreWeb.PageController do
  use StoreWeb, :controller
  alias Store.Sales

  def index(conn, _params) do
    IO.inspect(Confex.get_env(:store, :magazine))
    clothe_in_store = Sales.list_clothe_in_store()
    render(conn, "index.html", clothe_in_store: clothe_in_store)
  end
end
