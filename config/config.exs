# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tasker,
  ecto_repos: [Tasker.Repo]

# Configures the endpoint
config :tasker, TaskerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TSh2TxfIMLSGlhdphHeH8oWmxHY/Od2TsNcwPdyu+LE6rTXYyc2s+95oQ3WfzBhp",
  render_errors: [view: TaskerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tasker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
