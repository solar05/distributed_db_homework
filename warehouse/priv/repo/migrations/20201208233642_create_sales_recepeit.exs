defmodule Warehouse.Repo.Migrations.CreateSalesRecepeit do
  use Ecto.Migration

  def change do
    create table(:sales_recepeit) do
      add :employee_id, references(:employee), null: false
      add :magazine_id, references(:magazine), null: false
      add :sum, :integer, null: false
      add :sold_date, :date, null: false
      add :cashbox_num, :integer, null: false

      timestamps()
    end

  end
end
