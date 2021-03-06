defmodule StoreWeb.Authentication.ErrorHandler do
  use StoreWeb, :controller

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, reason}, _opts) do
    IO.inspect(type)
    IO.inspect(reason)

    conn
    |> put_flash(:error, "Ошибка аутентификации.")
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
