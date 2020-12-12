defmodule WarehouseWeb.Authentication.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :warehouse,
    error_handler: WarehouseWeb.Authentication.ErrorHandler,
    module: WarehouseWeb.Authentication

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
