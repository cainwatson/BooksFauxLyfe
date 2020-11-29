defmodule BooksFauxLyfe.Works.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :date_published, :date
    field :edition, :string
    field :isbn, :string
    field :title, :string

    timestamps(inserted_at: :date_inserted, updated_at: :date_updated)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:isbn, :title, :edition, :date_published])
    |> validate_required([:isbn, :title, :edition, :date_published])
  end
end
