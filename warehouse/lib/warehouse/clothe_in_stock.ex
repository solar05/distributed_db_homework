defmodule Warehouse.ClotheInStock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_in_stock" do
    field :place, :integer
    field :quantity, :integer

  end

  @doc false
  def changeset(clothe_in_stock, attrs) do
    clothe_in_stock
    |> cast(attrs, [:quantity, :place])
    |> validate_required([:quantity, :place])
  end
end
