defmodule BooksFauxLyfe.Repo.Migrations.CreateWorksAuthors do
  use Ecto.Migration

  def change do
    create table(:works_authors) do
      add :id_work, references(:works), null: false
      add :id_author, references(:authors), null: false

      timestamps(inserted_at: :date_inserted, updated_at: :date_updated)
    end

    create index(:works_authors, [:id_work])
    create index(:works_authors, [:id_author])
  end
end
