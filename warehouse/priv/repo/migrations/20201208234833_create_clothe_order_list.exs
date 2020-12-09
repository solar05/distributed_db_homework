defmodule Warehouse.Repo.Migrations.CreateClotheOrderList do
  use Ecto.Migration

  def change do
    create table(:clothe_order_list) do
      add :clothe_order_id, references(:clothe_order), null: false
      add :clothe_id, references(:clothe_example), null: false
      add :order_date, :date, null: false

    end

  end
end
