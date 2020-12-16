defmodule Warehouse.Sales.ClotheHandbook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_handbook" do
    field :article, :string
    field :gender, :string
    field :mark, :string
    field :material, :string
    field :price, :integer
    field :type, :string
  end

  @doc false
  def changeset(clothe_handbook, attrs) do
    clothe_handbook
    |> cast(attrs, [:article, :gender, :mark, :price, :type])
    |> validate_required([:article, :gender, :mark, :price, :type])
  end
end
