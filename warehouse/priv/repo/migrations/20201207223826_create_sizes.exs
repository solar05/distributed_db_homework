defmodule Warehouse.Repo.Migrations.CreateClotheSize do
  use Ecto.Migration

  def change do
    create table(:clothe_size) do
      add :size, :string, null: false

      timestamps()
    end

  end
end
