defmodule Warehouse.ClotheSupplied do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_supplied" do
    field :arrive_date, :date
    field :quantity, :integer

  end

  @doc false
  def changeset(clothe_supplied, attrs) do
    clothe_supplied
    |> cast(attrs, [:arrive_date, :quantity])
    |> validate_required([:arrive_date, :quantity])
  end
end
