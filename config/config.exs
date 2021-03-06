# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hr_hub,
  ecto_repos: [HrHub.Repo]

# Configures the endpoint
config :hr_hub, HrHubWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tdeMxZVH8tOEethlEJLzkiN59kdk8mpwdfkgMTZrjTLtJzFoEUZMxZ/OQTBLDUtk",
  render_errors: [view: HrHubWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HrHub.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
