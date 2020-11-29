defmodule BooksFauxLyfe.Repo do
  use Ecto.Repo,
    otp_app: :books_faux_lyfe,
    adapter: Ecto.Adapters.Postgres
end
