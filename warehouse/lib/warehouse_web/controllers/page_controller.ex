defmodule WarehouseWeb.PageController do
  use WarehouseWeb, :controller

  def index(conn, _params) do
    IO.inspect(Confex.get_env(:warehouse, :magazine))
    render(conn, "index.html")
  end
end
