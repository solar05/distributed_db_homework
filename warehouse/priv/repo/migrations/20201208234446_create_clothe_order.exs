defmodule Warehouse.Repo.Migrations.CreateClotheOrder do
  use Ecto.Migration

  def change do
    create table(:clothe_order) do
      add :employee_id, references(:employee), null: false
      add :magazine_id, references(:magazine), null: false
      add :is_ordered, :boolean, default: false, null: false
      add :quantity, :integer, null: false

    end

  end
end
