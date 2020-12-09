defmodule Warehouse.Repo.Migrations.AddPswdToEmployee do
  use Ecto.Migration

  def change do
    alter table("employee") do
      add :password, :string
    end
  end
end
