defmodule Warehouse.Repo.Migrations.CreateColours do
  use Ecto.Migration

  def change do
    create table(:colours) do
      add :colour, :string, null: false

      timestamps()
    end

  end
end
