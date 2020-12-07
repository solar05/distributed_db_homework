defmodule Warehouse.Repo.Migrations.CreateSizes do
  use Ecto.Migration

  def change do
    create table(:sizes) do
      add :size, :string, null: false

      timestamps()
    end

  end
end
