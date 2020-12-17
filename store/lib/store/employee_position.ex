defmodule Store.EmployeePosition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee_position" do
    field :position_name, :string
    field :position_salary, :integer

  end

  @doc false
  def changeset(employee_position, attrs) do
    employee_position
    |> cast(attrs, [:position_name, :position_salary])
    |> validate_required([:position_name, :position_salary])
  end
end
