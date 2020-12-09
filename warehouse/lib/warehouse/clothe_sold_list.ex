defmodule Warehouse.ClotheSoldList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_sold_list" do
    field :quantity, :integer

  end

  @doc false
  def changeset(clothe_sold_list, attrs) do
    clothe_sold_list
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
