defmodule WarehouseWeb.Router do
  use WarehouseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :guardian do
    plug WarehouseWeb.Authentication.Pipeline
  end

  pipeline :browser_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WarehouseWeb do
    pipe_through [:browser, :guardian]

    get "/", PageController, :index
    resources "/clothes", ClotheInStoreController
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
    resources "/checks", SalesRecepeitController, only: [:index, :show]
  end

  scope "/api", WarehouseWeb.Api, as: :api do
    pipe_through :api
    get "/orders/:id/:clothe/:employee", ClotheOrderController, :order
  end

  scope "/admin", WarehouseWeb.Sales do
    pipe_through [:browser, :guardian, :browser_auth]
    resources "/magazines", MagazineController, only: [:index]
    resources "/employee", EmployeeController, only: [:index]
  end

  scope "/admin", WarehouseWeb do
    pipe_through [:browser, :guardian, :browser_auth]
    resources "/orders", ClotheOrderController
  end

  # Other scopes may use custom stacks.
  # scope "/api", WarehouseWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: WarehouseWeb.Telemetry
    end
  end
end
