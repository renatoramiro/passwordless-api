# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :passwordless_web_api,
  ecto_repos: [PasswordlessWebApi.Repo]

# Configures the endpoint
config :passwordless_web_api, PasswordlessWebApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lU/4o4jJLFFRR9f2aO6hjcvjR67VQibrQ2xDBI/4xFb+ottcbL96JDVLLi94dKxe",
  render_errors: [view: PasswordlessWebApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PasswordlessWebApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


# -- Veil Configuration    Don't remove this line
config :veil,
  site_name: "Passwordless Site",
  email_from_name: "Renato Ramiro",
  email_from_address: "renatosramiro@gmail.com",
  sign_in_link_expiry: 3_600,
  session_expiry: 86_400 * 30,
  refresh_expiry_interval: 86_400

config :veil,Veil.Scheduler,
  jobs: [
    # Runs every midnight to delete all expired requests and sessions
    {"@daily", {PasswordlessWebApi.Veil.Clean, :expired, []}}
  ]

config :veil, PasswordlessWebApiWeb.Veil.Mailer,
  adapter: Swoosh.Adapters.SMTP,
  relay: "127.0.0.1",
  port: 1025,
  username: "",
  password: "",
  ssl: false,
  tls: :never

# -- End Veil Configuration
