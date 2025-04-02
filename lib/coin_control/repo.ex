defmodule CoinControl.Repo do
  use Ecto.Repo,
    otp_app: :coin_control,
    adapter: Ecto.Adapters.Postgres
end
