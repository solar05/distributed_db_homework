defmodule Warehouse.Repo.Migrations.CreateClotheOrder do
  use Ecto.Migration

  def change do
    create table(:clothe_order) do
      add :employee_id, references(:employee), null: false
      add :magazine_id, references(:magazine), null: false
      add :clothe_id, references(:clothe_example), null: false
      add :order_date, :date, null: false
      add :state, :string, null: false
      add :quantity, :integer, null: false

    end

  end
end
