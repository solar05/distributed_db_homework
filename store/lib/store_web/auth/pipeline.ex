defmodule StoreWeb.Authentication.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :store,
    error_handler: StoreWeb.Authentication.ErrorHandler,
    module: StoreWeb.Authentication

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
