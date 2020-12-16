defmodule WarehouseWeb.SessionController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias WarehouseWeb.Authentication

  def new(conn, _params) do
    if Authentication.current_user(conn) do
      redirect(conn, to: "/")
    else
      render(
        conn,
        :new,
        changeset: Sales.change_employee(),
        action: Routes.session_path(conn, :create)
      )
    end
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"employee" => %{"first_name" => first_name, "password" => password}}) do
    {pswd, _} = Integer.parse(password)
    IO.inspect(pswd)
    case first_name |> Sales.get_by_name() |> Authentication.authenticate(pswd) do
      {:ok, account} ->
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.clothe_in_store_path(conn, :index))

      {:error, :invalid_credentials} ->
        conn
        |> put_flash(:error, "Некорректный логин или пароль!")
        |> new(%{})
    end
  end

  def delete(conn, _params) do
    conn
    |> Authentication.log_out()
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
