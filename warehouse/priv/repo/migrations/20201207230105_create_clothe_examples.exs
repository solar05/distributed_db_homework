defmodule Warehouse.Repo.Migrations.CreateClotheExamples do
  use Ecto.Migration

  def change do
    create table(:clothe_examples) do
      add :colour_id, references(:colours)
      add :size_id, references(:sizes)
      add :handbook_id, references(:handbooks)
      timestamps()
    end

  end
end
