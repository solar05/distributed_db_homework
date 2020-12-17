defmodule WarehouseWeb.SalesRecepeitController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.SalesRecepeit

  def index(conn, _params) do
    sales_recepeit = Sales.list_sales_recepeit()
    render(conn, "index.html", sales_recepeit: sales_recepeit)
  end

  def new(conn, _params) do
    changeset = Sales.change_sales_recepeit(%SalesRecepeit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sales_recepeit" => sales_recepeit_params}) do
    case Sales.create_sales_recepeit(sales_recepeit_params) do
      {:ok, sales_recepeit} ->
        conn
        |> put_flash(:info, "Sales recepeit created successfully.")
        |> redirect(to: Routes.sales_recepeit_path(conn, :show, sales_recepeit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sales_recepeit = Sales.get_sales_recepeit!(id)
    render(conn, "show.html", sales_recepeit: sales_recepeit)
  end

  def edit(conn, %{"id" => id}) do
    sales_recepeit = Sales.get_sales_recepeit!(id)
    changeset = Sales.change_sales_recepeit(sales_recepeit)
    render(conn, "edit.html", sales_recepeit: sales_recepeit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sales_recepeit" => sales_recepeit_params}) do
    sales_recepeit = Sales.get_sales_recepeit!(id)

    case Sales.update_sales_recepeit(sales_recepeit, sales_recepeit_params) do
      {:ok, sales_recepeit} ->
        conn
        |> put_flash(:info, "Sales recepeit updated successfully.")
        |> redirect(to: Routes.sales_recepeit_path(conn, :show, sales_recepeit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sales_recepeit: sales_recepeit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sales_recepeit = Sales.get_sales_recepeit!(id)
    {:ok, _sales_recepeit} = Sales.delete_sales_recepeit(sales_recepeit)

    conn
    |> put_flash(:info, "Sales recepeit deleted successfully.")
    |> redirect(to: Routes.sales_recepeit_path(conn, :index))
  end
end
