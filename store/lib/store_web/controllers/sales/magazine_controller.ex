defmodule StoreWeb.Sales.MagazineController do
  use StoreWeb, :controller

  alias Store.Sales
  alias Store.Sales.Magazine

  def index(conn, _params) do
    magazine = Sales.list_magazine()
    render(conn, "index.html", magazine: magazine)
  end

  def new(conn, _params) do
    changeset = Sales.change_magazine(%Magazine{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"magazine" => magazine_params}) do
    case Sales.create_magazine(magazine_params) do
      {:ok, magazine} ->
        conn
        |> put_flash(:info, "Magazine created successfully.")
        |> redirect(to: Routes.sales_magazine_path(conn, :show, magazine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    magazine = Sales.get_magazine!(id)
    render(conn, "show.html", magazine: magazine)
  end

  def edit(conn, %{"id" => id}) do
    magazine = Sales.get_magazine!(id)
    changeset = Sales.change_magazine(magazine)
    render(conn, "edit.html", magazine: magazine, changeset: changeset)
  end

  def update(conn, %{"id" => id, "magazine" => magazine_params}) do
    magazine = Sales.get_magazine!(id)

    case Sales.update_magazine(magazine, magazine_params) do
      {:ok, magazine} ->
        conn
        |> put_flash(:info, "Magazine updated successfully.")
        |> redirect(to: Routes.sales_magazine_path(conn, :show, magazine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", magazine: magazine, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    magazine = Sales.get_magazine!(id)
    {:ok, _magazine} = Sales.delete_magazine(magazine)

    conn
    |> put_flash(:info, "Magazine deleted successfully.")
    |> redirect(to: Routes.sales_magazine_path(conn, :index))
  end
end
