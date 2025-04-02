defmodule CoinControl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CoinControlWeb.Telemetry,
      CoinControl.Repo,
      {DNSCluster, query: Application.get_env(:coin_control, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CoinControl.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CoinControl.Finch},
      # Start a worker by calling: CoinControl.Worker.start_link(arg)
      # {CoinControl.Worker, arg},
      # Start to serve requests, typically the last entry
      CoinControlWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoinControl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CoinControlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
