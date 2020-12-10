defmodule Warehouse.Sales.ClotheInStore do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_in_store" do
    field :quantity, :integer
    has_many :clothe_example, Sales.ClotheExample
    has_many :magazine, Magazine
  end

  @doc false
  def changeset(clothe_in_store, attrs) do
    clothe_in_store
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
