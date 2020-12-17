defmodule Store.Sales.ClotheOrder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_order" do
    field :order_date, :date
    field :quantity, :integer
    field :state, :string
    belongs_to :magazine, Store.Sales.Magazine
    belongs_to :employee, Store.Sales.Employee
    belongs_to :clothe, Store.Sales.ClotheExample

  end

  @doc false
  def changeset(clothe_order, attrs) do
    clothe_order
    |> cast(attrs, [:order_date, :state, :quantity])
    |> validate_required([:order_date, :state, :quantity])
  end
end
