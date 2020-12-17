defmodule Warehouse.Repo.Migrations.CreateClotheHandbook do
  use Ecto.Migration

  def change do
    create table(:clothe_handbook) do
      add :type, :string, null: false
      add :article, :string, null: false
      add :mark, :string, null: false
      add :price, :integer, null: false
      add :gender, :string, null: false

    end

  end
end
