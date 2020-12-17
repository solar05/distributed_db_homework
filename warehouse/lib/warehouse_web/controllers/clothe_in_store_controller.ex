defmodule WarehouseWeb.ClotheInStoreController do
  use WarehouseWeb, :controller

  alias Warehouse.Sales
  alias Warehouse.Sales.ClotheInStore
  alias Warehouse.Sales.SalesRecepeit
  alias Warehouse.Sales.ClotheOrder


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
    {quantity, _} =  Integer.parse(Map.get(clothe_in_store_params, "quantity"))
    diff = clothe_in_store.quantity - quantity

    case Sales.update_clothe_in_store(clothe_in_store, diff) do
      {:ok, clothe_in_store} ->
        {{year, month, date}, _} = :calendar.local_time
        curr_date = Date.from_iso8601!("#{year}-#{month}-#{date}")
        price = Sales.get_clothe_in_store_info(clothe_in_store.id).clothe.handbook.price
        sum = price * quantity
        employee = Enum.random(Sales.list_employees_id)
        current_mag = Sales.get_magazine!(Confex.get_env(:warehouse, :magazine))
        recepeit = Ecto.Changeset.change(%SalesRecepeit{},
          magazine_id: current_mag.id,
          employee_id: employee.id,
          clothe_in_store_id: clothe_in_store.id,
          sold_date: curr_date,
          quantity: quantity,
          sum: sum,
          cashbox_num: :rand.uniform(100))

        sales_recepeit = Sales.create_sales!(recepeit)

        if diff <= 5 and Sales.clothe_orders_exists?(clothe_in_store.clothe_id) do
          order = Ecto.Changeset.change(%ClotheOrder{},
            order_date: curr_date,
            employee_id: employee.id,
            magazine_id: current_mag.id,
            quantity: 20,
            state: "created",
            clothe_id: clothe_in_store.clothe.id
          )
          Sales.create_order!(order)
        end

        conn
            |> put_flash(:success, "Успешно куплено!")
            |> redirect(to: Routes.sales_recepeit_path(conn, :show, sales_recepeit))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
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
