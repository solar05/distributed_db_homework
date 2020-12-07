defmodule Warehouse.Repo.Migrations.CreateHandbooks do
  use Ecto.Migration

  def change do
    create table(:handbooks) do
      add :type, :string, null: false
      add :article, :string, null: false
      add :mark, :string, null: false
      add :price, :integer, null: false
      add :gender, :string, null: false

      timestamps()
    end

  end
end
