defmodule Warehouse.Sales.ClotheExample do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_example" do

  end

  @doc false
  def changeset(clothe_example, attrs) do
    clothe_example
    |> cast(attrs, [])
    |> validate_required([])
  end
end
