defmodule BooksFauxLyfe.Works.Author do
  @moduledoc false

  use BooksFauxLyfe.Schema
  import Ecto.Changeset

  schema "authors" do
    field :bio, :string
    field :date_death, :date
    field :dob, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :bio, :dob, :date_death])
    |> validate_required([:name, :bio, :dob, :date_death])
  end
end
