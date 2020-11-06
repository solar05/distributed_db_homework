# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :store,
  ecto_repos: [Store.Repo]

# Configures the endpoint
config :store, StoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qB+WvJK+hb67q4T1sW/75rKFGyfrO9n2KOSDYlM30EYxD0BF37poWzyP+nXem3Z7",
  render_errors: [view: StoreWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Store.PubSub,
  live_view: [signing_salt: "t06acScF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
