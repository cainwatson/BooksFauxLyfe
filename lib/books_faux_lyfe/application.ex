defmodule BooksFauxLyfe.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BooksFauxLyfe.Repo,
      # Start the Telemetry supervisor
      BooksFauxLyfeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BooksFauxLyfe.PubSub},
      # Start the Endpoint (http/https)
      BooksFauxLyfeWeb.Endpoint
      # Start a worker by calling: BooksFauxLyfe.Worker.start_link(arg)
      # {BooksFauxLyfe.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BooksFauxLyfe.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BooksFauxLyfeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
