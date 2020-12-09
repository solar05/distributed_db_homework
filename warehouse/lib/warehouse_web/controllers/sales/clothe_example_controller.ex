defmodule WarehouseWeb.Sales.ClotheExampleController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheExample

  def index(conn, _params) do
    clothe_example = Sales.list_clothe_example()
    render(conn, "index.html", clothe_example: clothe_example)
  end

  def new(conn, _params) do
    changeset = Sales.change_clothe_example(%ClotheExample{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clothe_example" => clothe_example_params}) do
    case Sales.create_clothe_example(clothe_example_params) do
      {:ok, clothe_example} ->
        conn
        |> put_flash(:info, "Clothe example created successfully.")
        |> redirect(to: Routes.sales_clothe_example_path(conn, :show, clothe_example))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clothe_example = Sales.get_clothe_example!(id)
    render(conn, "show.html", clothe_example: clothe_example)
  end

  def edit(conn, %{"id" => id}) do
    clothe_example = Sales.get_clothe_example!(id)
    changeset = Sales.change_clothe_example(clothe_example)
    render(conn, "edit.html", clothe_example: clothe_example, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clothe_example" => clothe_example_params}) do
    clothe_example = Sales.get_clothe_example!(id)

    case Sales.update_clothe_example(clothe_example, clothe_example_params) do
      {:ok, clothe_example} ->
        conn
        |> put_flash(:info, "Clothe example updated successfully.")
        |> redirect(to: Routes.sales_clothe_example_path(conn, :show, clothe_example))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clothe_example: clothe_example, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothe_example = Sales.get_clothe_example!(id)
    {:ok, _clothe_example} = Sales.delete_clothe_example(clothe_example)

    conn
    |> put_flash(:info, "Clothe example deleted successfully.")
    |> redirect(to: Routes.sales_clothe_example_path(conn, :index))
  end
end
