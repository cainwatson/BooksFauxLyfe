# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :books_faux_lyfe,
  ecto_repos: [BooksFauxLyfe.Repo]

# Configures the endpoint
config :books_faux_lyfe, BooksFauxLyfeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q61/WY7SHC7swQ6RMucJmLPqKFaYflk6BaOjiUQSxCzBKQje4FOkttuQ8TG3did8",
  render_errors: [view: BooksFauxLyfeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BooksFauxLyfe.PubSub,
  live_view: [signing_salt: "3aV6bK31"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
