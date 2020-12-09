defmodule Warehouse.Repo.Migrations.AddMaterial do
  use Ecto.Migration

  def change do
    alter table("clothe_handbook") do
      add :material, :string
    end
  end
end
