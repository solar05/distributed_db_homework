defmodule Warehouse.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employee) do
      add :magazine_id, references(:magazine), null: false
      add :position_id, references(:employee_position), null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :birth_date, :date, null: false
      add :hire_date, :date, null: false
      add :passport_number, :string, null: false
      add :phone_number, :string, null: false

      timestamps()
    end

  end
end
