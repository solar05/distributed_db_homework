defmodule Warehouse.ClotheHandbook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_handbook" do
    field :article, :string
    field :gender, :string
    field :mark, :string
    field :price, :integer
    field :type, :string

  end

  @doc false
  def changeset(handbook, attrs) do
    handbook
    |> cast(attrs, [:type, :article, :mark, :price, :gender])
    |> validate_required([:type, :article, :mark, :price, :gender])
  end
end
