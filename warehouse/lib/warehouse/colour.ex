defmodule Warehouse.Colour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colours" do
    field :colour, :string

    timestamps()
  end

  @doc false
  def changeset(colour, attrs) do
    colour
    |> cast(attrs, [:colour])
    |> validate_required([:colour])
  end
end
