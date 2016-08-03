# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :zelnite, Zelnite.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uxb5AOFEkQXoFmAo77mTv8klooEoVJcaT6acN6aSjwbnWvXQ2lmqSDwwhiU+V0X5",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Zelnite.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :zelnite, ecto_repos: [Zelnite.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
