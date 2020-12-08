defmodule Warehouse.Repo.Migrations.CreateClotheExample do
  use Ecto.Migration

  def change do
    create table(:clothe_example) do
      add :colour_id, references(:clothe_colour), null: false
      add :size_id, references(:clothe_size), null: false
      add :handbook_id, references(:clothe_handbook), null: false
      timestamps()
    end

  end
end
