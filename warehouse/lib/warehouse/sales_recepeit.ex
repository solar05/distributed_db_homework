defmodule Warehouse.SalesRecepeit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_recepeit" do
    field :cashbox_num, :integer
    field :sold_date, :date
    field :sum, :integer

  end

  @doc false
  def changeset(sales_recepeit, attrs) do
    sales_recepeit
    |> cast(attrs, [:sum, :sold_date, :cashbox_num])
    |> validate_required([:sum, :sold_date, :cashbox_num])
  end
end
