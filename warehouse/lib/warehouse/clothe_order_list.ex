defmodule Warehouse.ClotheOrderList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_order_list" do
    field :order_date, :date

  end

  @doc false
  def changeset(clothe_order_list, attrs) do
    clothe_order_list
    |> cast(attrs, [:order_date])
    |> validate_required([:order_date])
  end
end
