defmodule BooksFauxLyfe.Works.Work do
  @moduledoc false

  use BooksFauxLyfe.Schema
  import Ecto.Changeset

  schema "works" do
    field :languages, {:array, :string}
    field :subtitle, :string
    field :title, :string

    many_to_many :authors, BooksFauxLyfe.Works.Author,
      join_through: BooksFauxLyfe.Works.WorkAuthor,
      join_keys: [id_work: :id, id_author: :id]

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:title, :subtitle, :languages])
    |> validate_required([:title, :subtitle, :languages])
  end
end
