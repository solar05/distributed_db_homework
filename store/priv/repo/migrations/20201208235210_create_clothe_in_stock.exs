defmodule Warehouse.Repo.Migrations.CreateClotheInStock do
  use Ecto.Migration

  def change do
    create table(:clothe_in_stock) do
      add :clothe_id, references(:clothe_example), null: false
      add :quantity, :integer, null: false
      add :place, :integer, null: false

    end

  end
end
