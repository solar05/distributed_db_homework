defmodule WarehouseWeb.ClotheHandbookController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheHandbook

  def index(conn, _params) do
    clothe_handbook = Sales.list_clothe_handbook()
    render(conn, "index.html", clothe_handbook: clothe_handbook)
  end

  def new(conn, _params) do
    changeset = Sales.change_clothe_handbook(%ClotheHandbook{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clothe_handbook" => clothe_handbook_params}) do
    case Sales.create_clothe_handbook(clothe_handbook_params) do
      {:ok, clothe_handbook} ->
        conn
        |> put_flash(:info, "Clothe handbook created successfully.")
        |> redirect(to: Routes.clothe_handbook_path(conn, :show, clothe_handbook))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clothe_handbook = Sales.get_clothe_handbook!(id)
    render(conn, "show.html", clothe_handbook: clothe_handbook)
  end

  def edit(conn, %{"id" => id}) do
    clothe_handbook = Sales.get_clothe_handbook!(id)
    changeset = Sales.change_clothe_handbook(clothe_handbook)
    render(conn, "edit.html", clothe_handbook: clothe_handbook, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clothe_handbook" => clothe_handbook_params}) do
    clothe_handbook = Sales.get_clothe_handbook!(id)

    case Sales.update_clothe_handbook(clothe_handbook, clothe_handbook_params) do
      {:ok, clothe_handbook} ->
        conn
        |> put_flash(:info, "Clothe handbook updated successfully.")
        |> redirect(to: Routes.clothe_handbook_path(conn, :show, clothe_handbook))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clothe_handbook: clothe_handbook, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothe_handbook = Sales.get_clothe_handbook!(id)
    {:ok, _clothe_handbook} = Sales.delete_clothe_handbook(clothe_handbook)

    conn
    |> put_flash(:info, "Clothe handbook deleted successfully.")
    |> redirect(to: Routes.clothe_handbook_path(conn, :index))
  end
end
