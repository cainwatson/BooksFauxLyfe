defmodule BooksFauxLyfe.Repo.Migrations.CreateWorks do
  use Ecto.Migration

  def change do
    create table(:works) do
      add :title, :string, null: false
      add :subtitle, :string
      add :languages, {:array, :string}

      timestamps(inserted_at: :date_inserted, updated_at: :date_updated)
    end

    alter table(:books) do
      add :id_work, references(:works)
    end
  end
end
