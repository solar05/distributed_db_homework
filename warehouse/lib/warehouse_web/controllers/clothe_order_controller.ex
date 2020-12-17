defmodule WarehouseWeb.ClotheOrderController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheOrder

  def index(conn, _params) do
    clothe_order = Sales.list_clothe_order()
    render(conn, "index.html", clothe_order: clothe_order)
  end

  def new(conn, %{"id" => id}) do
    clothe_order = Sales.get_clothe_order!(id)
    case Sales.update_clothe_order(clothe_order, %{"state" => "ordered"}) do
      {:ok, clothe_order} ->
        conn
        |> put_flash(:success, "Заказ подтвержден!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:error, "Произошла ошибка!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))
    end
  end

  def create(conn, %{"id" => id}) do
    clothe_order = Sales.get_clothe_order!(id)
    case Sales.update_clothe_order(clothe_order, %{"state" => "ordered"}) do
      {:ok, clothe_order} ->
        conn
        |> put_flash(:success, "Заказ подтвержден!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:error, "Произошла ошибка!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))
    end
  end

  def show(conn, %{"id" => id}) do
    clothe_order = Sales.get_clothe_order!(id)
    render(conn, "show.html", clothe_order: clothe_order)
  end

  def edit(conn, %{"id" => id}) do
    clothe_order = Sales.get_clothe_order!(id)
    case Sales.update_clothe_order(clothe_order, %{"state" => "delivered"}) do
      {:ok, clothe_order} ->
        conn
        |> put_flash(:success, "Заказ выполнен!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:error, "Произошла ошибка!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))
      end
  end

  def update(conn, %{"id" => id, "clothe_order" => clothe_order_params}) do
    clothe_order = Sales.get_clothe_order!(id)

    case Sales.update_clothe_order(clothe_order, clothe_order_params) do
      {:ok, clothe_order} ->
        conn
        |> put_flash(:info, "Clothe order updated successfully.")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clothe_order: clothe_order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothe_order = Sales.get_clothe_order!(id)
    case Sales.update_clothe_order(clothe_order, %{"state" => "ordered"}) do
      {:ok, clothe_order} ->
        conn
        |> put_flash(:success, "Заказ подтвержден!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:error, "Произошла ошибка!")
        |> redirect(to: Routes.clothe_order_path(conn, :show, clothe_order))
    end
  end
end
