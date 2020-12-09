defmodule Warehouse.Repo.Migrations.CreateClotheSupplied do
  use Ecto.Migration

  def change do
    create table(:clothe_supplied) do
      add :clothe_in_stock_id, references(:clothe_in_stock), null: false
      add :clothe_order_id, references(:clothe_order), null: false
      add :arrive_date, :date, null: false
      add :quantity, :integer, null: false

    end

  end
end
