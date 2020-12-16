defmodule Warehouse.Sales.ClotheExample do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_example" do
    belongs_to :size, Warehouse.Sales.ClotheSize
    belongs_to :colour, Warehouse.Sales.ClotheColour
    belongs_to :handbook, Warehouse.Sales.ClotheHandbook
  end

  @doc false
  def changeset(clothe_example, attrs) do
    clothe_example
    |> cast(attrs, [])
    |> validate_required([])
  end
end
