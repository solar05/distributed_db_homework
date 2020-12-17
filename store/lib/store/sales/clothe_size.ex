defmodule Store.Sales.ClotheSize do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_size" do
    field :size, :string
  end

  @doc false
  def changeset(size, attrs) do
    size
    |> cast(attrs, [:size])
    |> validate_required([:size])
  end
end
