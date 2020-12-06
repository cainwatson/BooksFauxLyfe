defmodule BooksFauxLyfe.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :bio, :string
      add :dob, :date
      add :date_death, :date

      timestamps(inserted_at: :date_inserted, updated_at: :date_updated)
    end
  end
end
