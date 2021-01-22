defmodule Log.Repo do
  use Ecto.Repo,
    otp_app: :log,
    adapter: Ecto.Adapters.Postgres
end
