defmodule Warehouse.Sales.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee" do
    field :birth_date, :date
    field :first_name, :string
    field :hire_date, :date
    field :last_name, :string
    field :passport_number, :string
    field :phone_number, :string
    field :password, :integer
    belongs_to :magazine, Warehouse.Sales.Magazine
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:first_name, :last_name, :birth_date, :hire_date, :passport_number, :phone_number])
    |> validate_required([:first_name, :last_name, :birth_date, :hire_date, :passport_number, :phone_number])
  end
end
