defmodule Warehouse.Repo.Migrations.CreateMagazine do
  use Ecto.Migration

  def change do
    create table(:magazine) do
      add :city, :string, null: false
      add :street, :string, null: false
      add :house, :integer, null: false
      add :inn, :integer, null: false

    end

  end
end
