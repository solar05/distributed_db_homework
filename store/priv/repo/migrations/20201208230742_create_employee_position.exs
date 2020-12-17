defmodule Warehouse.Repo.Migrations.CreateEmployeePosition do
  use Ecto.Migration

  def change do
    create table(:employee_position) do
      add :position_name, :string, null: false
      add :position_salary, :integer, null: false

    end

  end
end
