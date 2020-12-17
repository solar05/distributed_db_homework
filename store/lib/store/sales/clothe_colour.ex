defmodule Store.Sales.ClotheColour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_colour" do
    field :colour, :string
  end

  @doc false
  def changeset(clothe_colour, attrs) do
    clothe_colour
    |> cast(attrs, [:colour])
    |> validate_required([:colour])
  end
end
