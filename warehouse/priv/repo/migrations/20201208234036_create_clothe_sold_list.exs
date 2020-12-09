defmodule Warehouse.Repo.Migrations.CreateClotheSoldList do
  use Ecto.Migration

  def change do
    create table(:clothe_sold_list) do
      add :sales_recepeit, references(:sales_recepeit), null: false
      add :clothe_in_store_id, references(:clothe_in_store), null: false
      add :quantity, :integer, null: false

    end

  end
end
