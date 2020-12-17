defmodule Store.Sales.ClotheExample do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_example" do
    belongs_to :size, Store.Sales.ClotheSize
    belongs_to :colour, Store.Sales.ClotheColour
    belongs_to :handbook, Store.Sales.ClotheHandbook
  end

  @doc false
  def changeset(clothe_example, attrs) do
    clothe_example
    |> cast(attrs, [])
    |> validate_required([])
  end
end
