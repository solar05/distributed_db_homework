defmodule Warehouse.Sales.ClotheOrder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_order" do
    field :order_date, :date
    field :quantity, :integer
    field :state, :string
    belongs_to :magazine, Warehouse.Sales.Magazine
    belongs_to :employee, Warehouse.Sales.Employee
    belongs_to :clothe, Warehouse.Sales.ClotheExample

  end

  @doc false
  def changeset(clothe_order, attrs) do
    clothe_order
    |> cast(attrs, [:order_date, :state, :quantity])
    |> validate_required([:order_date, :state, :quantity])
  end
end
