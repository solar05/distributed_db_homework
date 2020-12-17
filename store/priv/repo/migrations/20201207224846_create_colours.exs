defmodule Warehouse.Repo.Migrations.CreateClotheColour do
  use Ecto.Migration

  def change do
    create table(:clothe_colour) do
      add :colour, :string, null: false

    end

  end
end
