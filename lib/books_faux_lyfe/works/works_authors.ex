defmodule BooksFauxLyfe.Works.WorkAuthor do
  @moduledoc false

  use BooksFauxLyfe.Schema
  import Ecto.Changeset

  schema "works_authors" do
    belongs_to :work, BooksFauxLyfe.Works.Work, foreign_key: :id_work
    belongs_to :author, BooksFauxLyfe.Works.Author, foreign_key: :id_author

    timestamps()
  end

  @doc false
  def changeset(work_author, attrs) do
    work_author
    |> cast(attrs, [:id_work, :id_author])
    |> validate_required([:id_work, :id_author])
  end
end
