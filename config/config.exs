# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :slack, ecto_repos: [Slack.Repo]

# Configures the endpoint
config :slack, Slack.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VSgN7zLUCyAdgsio1RbGYEVMACelgTQq6FQozsGJ4vemV0OiO4k0f+Ji+GaW7CN0",
  render_errors: [view: Slack.ErrorView, accepts: ~w(json)],
  pubsub: [name: Slack.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Slack",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Slack.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
