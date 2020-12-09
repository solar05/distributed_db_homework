defmodule Warehouse.ClotheOrder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_order" do
    field :is_ordered, :boolean, default: false
    field :quantity, :integer

  end

  @doc false
  def changeset(clothe_order, attrs) do
    clothe_order
    |> cast(attrs, [:is_ordered, :quantity])
    |> validate_required([:is_ordered, :quantity])
  end
end
