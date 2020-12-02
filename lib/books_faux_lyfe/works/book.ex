defmodule BooksFauxLyfe.Works.Book do
  @moduledoc false

  use BooksFauxLyfe.Schema
  import Ecto.Changeset

  schema "books" do
    field :date_published, :date
    field :edition, :string
    field :isbn, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:isbn, :title, :edition, :date_published])
    |> validate_required([:isbn, :title, :edition, :date_published])
  end
end
