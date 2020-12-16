defmodule WarehouseWeb.ClotheColourController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheColour

  def index(conn, _params) do
    clothe_colour = Sales.list_clothe_colour()
    render(conn, "index.html", clothe_colour: clothe_colour)
  end

  def new(conn, _params) do
    changeset = Sales.change_clothe_colour(%ClotheColour{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clothe_colour" => clothe_colour_params}) do
    case Sales.create_clothe_colour(clothe_colour_params) do
      {:ok, clothe_colour} ->
        conn
        |> put_flash(:info, "Clothe colour created successfully.")
        |> redirect(to: Routes.clothe_colour_path(conn, :show, clothe_colour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clothe_colour = Sales.get_clothe_colour!(id)
    render(conn, "show.html", clothe_colour: clothe_colour)
  end

  def edit(conn, %{"id" => id}) do
    clothe_colour = Sales.get_clothe_colour!(id)
    changeset = Sales.change_clothe_colour(clothe_colour)
    render(conn, "edit.html", clothe_colour: clothe_colour, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clothe_colour" => clothe_colour_params}) do
    clothe_colour = Sales.get_clothe_colour!(id)

    case Sales.update_clothe_colour(clothe_colour, clothe_colour_params) do
      {:ok, clothe_colour} ->
        conn
        |> put_flash(:info, "Clothe colour updated successfully.")
        |> redirect(to: Routes.clothe_colour_path(conn, :show, clothe_colour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clothe_colour: clothe_colour, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothe_colour = Sales.get_clothe_colour!(id)
    {:ok, _clothe_colour} = Sales.delete_clothe_colour(clothe_colour)

    conn
    |> put_flash(:info, "Clothe colour deleted successfully.")
    |> redirect(to: Routes.clothe_colour_path(conn, :index))
  end
end
