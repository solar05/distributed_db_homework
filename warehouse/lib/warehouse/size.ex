defmodule Warehouse.Size do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sizes" do
    field :size, :string

    timestamps()
  end

  @doc false
  def changeset(size, attrs) do
    size
    |> cast(attrs, [:size])
    |> validate_required([:size])
  end
end
