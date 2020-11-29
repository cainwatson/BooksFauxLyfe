defmodule BooksFauxLyfe.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :isbn, :string, null: false
      add :title, :string
      add :edition, :string
      add :date_published, :date

      timestamps(inserted_at: :date_inserted, updated_at: :date_updated)
    end
  end
end
