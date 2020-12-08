defmodule Warehouse.Magazine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "magazine" do
    field :city, :string
    field :house, :integer
    field :inn, :integer
    field :street, :string

    timestamps()
  end

  @doc false
  def changeset(magazine, attrs) do
    magazine
    |> cast(attrs, [:city, :street, :house, :inn])
    |> validate_required([:city, :street, :house, :inn])
  end
end
