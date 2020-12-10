defmodule WarehouseWeb.ClotheInStoreController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheInStore

  def index(conn, _params) do
    clothe_in_store = Sales.list_clothe_in_store()
    render(conn, "index.html", clothe_in_store: clothe_in_store)
  end

  def new(conn, _params) do
    changeset = Sales.change_clothe_in_store(%ClotheInStore{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clothe_in_store" => clothe_in_store_params}) do
    case Sales.create_clothe_in_store(clothe_in_store_params) do
      {:ok, clothe_in_store} ->
        conn
        |> put_flash(:info, "Clothe in store created successfully.")
        |> redirect(to: Routes.clothe_in_store_path(conn, :show, clothe_in_store))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clothe_in_store = Sales.get_clothe_in_store!(id)
    render(conn, "show.html", clothe_in_store: clothe_in_store)
  end

  def edit(conn, %{"id" => id}) do
    clothe_in_store = Sales.get_clothe_in_store!(id)
    changeset = Sales.change_clothe_in_store(clothe_in_store)
    render(conn, "edit.html", clothe_in_store: clothe_in_store, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clothe_in_store" => clothe_in_store_params}) do
    clothe_in_store = Sales.get_clothe_in_store!(id)

    case Sales.update_clothe_in_store(clothe_in_store, clothe_in_store_params) do
      {:ok, clothe_in_store} ->
        conn
        |> put_flash(:info, "Clothe in store updated successfully.")
        |> redirect(to: Routes.clothe_in_store_path(conn, :show, clothe_in_store))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clothe_in_store: clothe_in_store, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothe_in_store = Sales.get_clothe_in_store!(id)
    {:ok, _clothe_in_store} = Sales.delete_clothe_in_store(clothe_in_store)

    conn
    |> put_flash(:info, "Clothe in store deleted successfully.")
    |> redirect(to: Routes.clothe_in_store_path(conn, :index))
  end
end
