defmodule Warehouse.Sales.SalesRecepeit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_recepeit" do
    field :cashbox_num, :integer
    field :quantity, :integer
    field :sold_date, :date
    field :sum, :integer
    belongs_to :magazine, Warehouse.Sales.Magazine
    belongs_to :employee, Warehouse.Sales.Employee
    belongs_to :clothe_in_store, Warehouse.Sales.ClotheInStore
  end

  @doc false
  def changeset(sales_recepeit, attrs) do
    sales_recepeit
    |> cast(attrs, [:sum, :sold_date, :cashbox_num, :quantity])
    |> validate_required([:sum, :sold_date, :cashbox_num, :quantity])
  end
end
