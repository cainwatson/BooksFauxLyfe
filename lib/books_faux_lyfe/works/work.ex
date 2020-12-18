defmodule BooksFauxLyfe.Works.Work do
  @moduledoc false

  use BooksFauxLyfe.Schema
  import Ecto.Changeset

  schema "works" do
    field :languages, {:array, :string}
    field :subtitle, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:title, :subtitle, :languages])
    |> validate_required([:title, :subtitle, :languages])
  end
end
