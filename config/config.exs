# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :log,
  ecto_repos: [Log.Repo]

# Configures the endpoint
config :log, LogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Gw0LjZgw9i5AtszJGm3/tjUa1vIr4e20/7zOfP16CIJFsi7WIjizMOAhGNjkeUvq",
  render_errors: [view: LogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Log.PubSub,
  live_view: [signing_salt: "JVofn9Oz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
