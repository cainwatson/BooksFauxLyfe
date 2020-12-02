defmodule BooksFauxLyfe.Schema do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      @timestamps_opts [
        inserted_at: :date_inserted,
        updated_at: :date_updated,
        type: :utc_datetime
      ]
    end
  end
end
