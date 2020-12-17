defmodule Store.Sales.ClotheInStore do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clothe_in_store" do
    field :quantity, :integer
    belongs_to :clothe, Store.Sales.ClotheExample
    belongs_to :magazine, Store.Sales.Magazine
  end

  @doc false
  def changeset(clothe_in_store, attrs) do
    clothe_in_store
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end

  defp validate_quantity(changeset, clothe_in_store) do
    quantity = get_field(changeset, :quantity)
    curr_quantity = clothe_in_store.quantity
    diff = curr_quantity - quantity
    cond do
      diff > 0 ->
          changeset
      diff <= 0 ->
        add_error(changeset, :quantity, "Нельзя купить больше товара, чем есть в наличии!")
    end
  end

end
