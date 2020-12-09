defmodule Warehouse.Repo.Migrations.CreateClotheInStore do
  use Ecto.Migration

  def change do
    create table(:clothe_in_store) do
      add :clothe_id, references(:clothe_example), null: false
      add :magazine_id, references(:magazine), null: false
      add :quantity, :integer, null: false

    end

  end
end
