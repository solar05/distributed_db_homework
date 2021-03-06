defmodule Store.Sales do
  @moduledoc """
  The Sales context.
  """

  import Ecto.Query, warn: false
  alias Store.Repo

  alias Store.Sales.ClotheExample

  @doc """
  Returns the list of clothe_example.

  ## Examples

      iex> list_clothe_example()
      [%ClotheExample{}, ...]

  """
  def list_clothe_example do
    Repo.all(ClotheExample)
  end

  @doc """
  Gets a single clothe_example.

  Raises `Ecto.NoResultsError` if the Clothe example does not exist.

  ## Examples

      iex> get_clothe_example!(123)
      %ClotheExample{}

      iex> get_clothe_example!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe_example!(id), do: Repo.get!(ClotheExample, id)

  @doc """
  Creates a clothe_example.

  ## Examples

      iex> create_clothe_example(%{field: value})
      {:ok, %ClotheExample{}}

      iex> create_clothe_example(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe_example(attrs \\ %{}) do
    %ClotheExample{}
    |> ClotheExample.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe_example.

  ## Examples

      iex> update_clothe_example(clothe_example, %{field: new_value})
      {:ok, %ClotheExample{}}

      iex> update_clothe_example(clothe_example, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe_example(%ClotheExample{} = clothe_example, attrs) do
    clothe_example
    |> ClotheExample.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clothe_example.

  ## Examples

      iex> delete_clothe_example(clothe_example)
      {:ok, %ClotheExample{}}

      iex> delete_clothe_example(clothe_example)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe_example(%ClotheExample{} = clothe_example) do
    Repo.delete(clothe_example)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe_example changes.

  ## Examples

      iex> change_clothe_example(clothe_example)
      %Ecto.Changeset{data: %ClotheExample{}}

  """
  def change_clothe_example(%ClotheExample{} = clothe_example, attrs \\ %{}) do
    ClotheExample.changeset(clothe_example, attrs)
  end

  alias Store.Sales.ClotheInStore

  @doc """
  Returns the list of clothe_in_store.

  ## Examples

      iex> list_clothe_in_store()
      [%ClotheInStore{}, ...]

  """
  def list_clothe_in_store do
    current_mag = Confex.get_env(:store, :magazine)
    result = from clothe in ClotheInStore,
     where: clothe.magazine_id == ^current_mag,
     order_by: clothe.id
    Repo.all(result)
    |> Repo.preload([:magazine, clothe: [:colour, :size, :handbook]])
  end

  @spec get_clothe_in_store!(any) :: any
  @doc """
  Gets a single clothe_in_store.

  Raises `Ecto.NoResultsError` if the Clothe in store does not exist.

  ## Examples

      iex> get_clothe_in_store!(123)
      %ClotheInStore{}

      iex> get_clothe_in_store!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe_in_store!(id) do
    Repo.get!(ClotheInStore, id)
    |> Repo.preload([:magazine, clothe: [:colour, :size, :handbook]])
  end

  @doc """
  Creates a clothe_in_store.

  ## Examples

      iex> create_clothe_in_store(%{field: value})
      {:ok, %ClotheInStore{}}

      iex> create_clothe_in_store(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe_in_store(attrs \\ %{}) do
    %ClotheInStore{}
    |> ClotheInStore.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe_in_store.

  ## Examples

      iex> update_clothe_in_store(clothe_in_store, %{field: new_value})
      {:ok, %ClotheInStore{}}

      iex> update_clothe_in_store(clothe_in_store, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe_in_store(%ClotheInStore{} = clothe_in_store, attrs) do
    clothe_in_store
    |> ClotheInStore.changeset(%{"quantity" => attrs})
    |> Repo.update()
  end

  def refill_clothe_in_store(clothe_id, quantity) do
    current_mag = Confex.get_env(:store, :magazine)
    query = from clothe in ClotheInStore,
     where: clothe.magazine_id == ^current_mag and clothe.clothe_id == ^clothe_id,
     limit: 1
    result = List.first(Repo.all(query))
    ClotheInStore.changeset(result, %{"quantity" => result.quantity + quantity})
    |> Repo.update()
  end

  def get_clothe_in_store_info(id) do
    Repo.get!(ClotheInStore, id)
    |> Repo.preload([clothe: [:handbook]])
  end

  @doc """
  Deletes a clothe_in_store.

  ## Examples

      iex> delete_clothe_in_store(clothe_in_store)
      {:ok, %ClotheInStore{}}

      iex> delete_clothe_in_store(clothe_in_store)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe_in_store(%ClotheInStore{} = clothe_in_store) do
    Repo.delete(clothe_in_store)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe_in_store changes.

  ## Examples

      iex> change_clothe_in_store(clothe_in_store)
      %Ecto.Changeset{data: %ClotheInStore{}}

  """
  def change_clothe_in_store(%ClotheInStore{} = clothe_in_store, attrs \\ %{}) do
    ClotheInStore.changeset(clothe_in_store, attrs)
  end

  alias Store.Sales.Employee

  @doc """
  Returns the list of employee.

  ## Examples

      iex> list_employee()
      [%Employee{}, ...]

  """
  def list_employee do
    current_mag = Confex.get_env(:store, :magazine)
    if current_mag == 1 do
      Repo.all(Employee)
      |> Repo.preload([:magazine, :position])
    else
      query = from employee in Employee,
      where: employee.magazine_id == ^current_mag,
      order_by: employee.id
      Repo.all(query)
      |> Repo.preload([:magazine, :position])
    end
  end

  def list_employees_id() do
    current_mag = Confex.get_env(:store, :magazine)
    result = from employee in Employee,
     where: employee.magazine_id == ^current_mag,
     order_by: employee.id
    Repo.all(result)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{data: %Employee{}}

  """
  def change_employee(employee \\ %Employee{}) do
    Employee.changeset(employee, %{})
  end

  def get_by_name(name) do
    current_mag = Confex.get_env(:store, :magazine)
    Repo.get_by(Employee, [first_name: name, magazine_id: current_mag])
  end

  alias Store.Sales.Magazine

  @doc """
  Returns the list of magazine.

  ## Examples

      iex> list_magazine()
      [%Magazine{}, ...]

  """
  def list_magazine do
    Repo.all(Magazine)
  end

  @doc """
  Gets a single magazine.

  Raises `Ecto.NoResultsError` if the Magazine does not exist.

  ## Examples

      iex> get_magazine!(123)
      %Magazine{}

      iex> get_magazine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_magazine!(id), do: Repo.get!(Magazine, id)

  @doc """
  Creates a magazine.

  ## Examples

      iex> create_magazine(%{field: value})
      {:ok, %Magazine{}}

      iex> create_magazine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_magazine(attrs \\ %{}) do
    %Magazine{}
    |> Magazine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a magazine.

  ## Examples

      iex> update_magazine(magazine, %{field: new_value})
      {:ok, %Magazine{}}

      iex> update_magazine(magazine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_magazine(%Magazine{} = magazine, attrs) do
    magazine
    |> Magazine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a magazine.

  ## Examples

      iex> delete_magazine(magazine)
      {:ok, %Magazine{}}

      iex> delete_magazine(magazine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_magazine(%Magazine{} = magazine) do
    Repo.delete(magazine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking magazine changes.

  ## Examples

      iex> change_magazine(magazine)
      %Ecto.Changeset{data: %Magazine{}}

  """
  def change_magazine(%Magazine{} = magazine, attrs \\ %{}) do
    Magazine.changeset(magazine, attrs)
  end

  alias Store.Sales.ClotheSize

  @doc """
  Returns the list of clothe_size.

  ## Examples

      iex> list_clothe_size()
      [%ClotheSize{}, ...]

  """
  def list_clothe_size do
    Repo.all(ClotheSize)
  end

  @doc """
  Gets a single clothe_size.

  Raises `Ecto.NoResultsError` if the Clothe size does not exist.

  ## Examples

      iex> get_clothe_size!(123)
      %ClotheSize{}

      iex> get_clothe_size!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe_size!(id), do: Repo.get!(ClotheSize, id)

  @doc """
  Creates a clothe_size.

  ## Examples

      iex> create_clothe_size(%{field: value})
      {:ok, %ClotheSize{}}

      iex> create_clothe_size(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe_size(attrs \\ %{}) do
    %ClotheSize{}
    |> ClotheSize.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe_size.

  ## Examples

      iex> update_clothe_size(clothe_size, %{field: new_value})
      {:ok, %ClotheSize{}}

      iex> update_clothe_size(clothe_size, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe_size(%ClotheSize{} = clothe_size, attrs) do
    clothe_size
    |> ClotheSize.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clothe_size.

  ## Examples

      iex> delete_clothe_size(clothe_size)
      {:ok, %ClotheSize{}}

      iex> delete_clothe_size(clothe_size)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe_size(%ClotheSize{} = clothe_size) do
    Repo.delete(clothe_size)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe_size changes.

  ## Examples

      iex> change_clothe_size(clothe_size)
      %Ecto.Changeset{data: %ClotheSize{}}

  """
  def change_clothe_size(%ClotheSize{} = clothe_size, attrs \\ %{}) do
    ClotheSize.changeset(clothe_size, attrs)
  end

  alias Store.Sales.ClotheColour

  @doc """
  Returns the list of clothe_colour.

  ## Examples

      iex> list_clothe_colour()
      [%ClotheColour{}, ...]

  """
  def list_clothe_colour do
    Repo.all(ClotheColour)
  end

  @doc """
  Gets a single clothe_colour.

  Raises `Ecto.NoResultsError` if the Clothe colour does not exist.

  ## Examples

      iex> get_clothe_colour!(123)
      %ClotheColour{}

      iex> get_clothe_colour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe_colour!(id), do: Repo.get!(ClotheColour, id)

  @doc """
  Creates a clothe_colour.

  ## Examples

      iex> create_clothe_colour(%{field: value})
      {:ok, %ClotheColour{}}

      iex> create_clothe_colour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe_colour(attrs \\ %{}) do
    %ClotheColour{}
    |> ClotheColour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe_colour.

  ## Examples

      iex> update_clothe_colour(clothe_colour, %{field: new_value})
      {:ok, %ClotheColour{}}

      iex> update_clothe_colour(clothe_colour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe_colour(%ClotheColour{} = clothe_colour, attrs) do
    clothe_colour
    |> ClotheColour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clothe_colour.

  ## Examples

      iex> delete_clothe_colour(clothe_colour)
      {:ok, %ClotheColour{}}

      iex> delete_clothe_colour(clothe_colour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe_colour(%ClotheColour{} = clothe_colour) do
    Repo.delete(clothe_colour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe_colour changes.

  ## Examples

      iex> change_clothe_colour(clothe_colour)
      %Ecto.Changeset{data: %ClotheColour{}}

  """
  def change_clothe_colour(%ClotheColour{} = clothe_colour, attrs \\ %{}) do
    ClotheColour.changeset(clothe_colour, attrs)
  end

  alias Store.Sales.ClotheHandbook

  @doc """
  Returns the list of clothe_handbook.

  ## Examples

      iex> list_clothe_handbook()
      [%ClotheHandbook{}, ...]

  """
  def list_clothe_handbook do
    Repo.all(ClotheHandbook)
  end

  @doc """
  Gets a single clothe_handbook.

  Raises `Ecto.NoResultsError` if the Clothe handbook does not exist.

  ## Examples

      iex> get_clothe_handbook!(123)
      %ClotheHandbook{}

      iex> get_clothe_handbook!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe_handbook!(id), do: Repo.get!(ClotheHandbook, id)

  @doc """
  Creates a clothe_handbook.

  ## Examples

      iex> create_clothe_handbook(%{field: value})
      {:ok, %ClotheHandbook{}}

      iex> create_clothe_handbook(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe_handbook(attrs \\ %{}) do
    %ClotheHandbook{}
    |> ClotheHandbook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe_handbook.

  ## Examples

      iex> update_clothe_handbook(clothe_handbook, %{field: new_value})
      {:ok, %ClotheHandbook{}}

      iex> update_clothe_handbook(clothe_handbook, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe_handbook(%ClotheHandbook{} = clothe_handbook, attrs) do
    clothe_handbook
    |> ClotheHandbook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clothe_handbook.

  ## Examples

      iex> delete_clothe_handbook(clothe_handbook)
      {:ok, %ClotheHandbook{}}

      iex> delete_clothe_handbook(clothe_handbook)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe_handbook(%ClotheHandbook{} = clothe_handbook) do
    Repo.delete(clothe_handbook)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe_handbook changes.

  ## Examples

      iex> change_clothe_handbook(clothe_handbook)
      %Ecto.Changeset{data: %ClotheHandbook{}}

  """
  def change_clothe_handbook(%ClotheHandbook{} = clothe_handbook, attrs \\ %{}) do
    ClotheHandbook.changeset(clothe_handbook, attrs)
  end

  def current_magazine?(mag_id) do
    current_mag = Confex.get_env(:store, :magazine)
    mag_id == current_mag
  end

  alias Store.Sales.SalesRecepeit

  @doc """
  Returns the list of sales_recepeit.

  ## Examples

      iex> list_sales_recepeit()
      [%SalesRecepeit{}, ...]

  """
  def list_sales_recepeit do
    current_mag = Confex.get_env(:store, :magazine)
    result = from sales in SalesRecepeit,
     where: sales.magazine_id == ^current_mag,
     order_by: sales.id
    Repo.all(result)
  |> Repo.preload([:magazine, :employee,  clothe_in_store: [clothe: [:colour, :size, :handbook]]])
  end

  @doc """
  Gets a single sales_recepeit.

  Raises `Ecto.NoResultsError` if the Sales recepeit does not exist.

  ## Examples

      iex> get_sales_recepeit!(123)
      %SalesRecepeit{}

      iex> get_sales_recepeit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sales_recepeit!(id) do
    Repo.get!(SalesRecepeit, id)
    |> Repo.preload([:magazine, :employee,  clothe_in_store: [clothe: [:colour, :size, :handbook]]])
  end

  @doc """
  Creates a sales_recepeit.

  ## Examples

      iex> create_sales_recepeit(%{field: value})
      {:ok, %SalesRecepeit{}}

      iex> create_sales_recepeit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sales_recepeit(attrs \\ %{}) do
    %SalesRecepeit{}
    |> SalesRecepeit.changeset(attrs)
    |> Repo.insert()
  end

  def create_sales!(changeset) do
    Repo.insert!(changeset)
  end

  def create_order!(changeset) do
    Repo.insert!(changeset)
  end

  @doc """
  Updates a sales_recepeit.

  ## Examples

      iex> update_sales_recepeit(sales_recepeit, %{field: new_value})
      {:ok, %SalesRecepeit{}}

      iex> update_sales_recepeit(sales_recepeit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sales_recepeit(%SalesRecepeit{} = sales_recepeit, attrs) do
    sales_recepeit
    |> SalesRecepeit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sales_recepeit.

  ## Examples

      iex> delete_sales_recepeit(sales_recepeit)
      {:ok, %SalesRecepeit{}}

      iex> delete_sales_recepeit(sales_recepeit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sales_recepeit(%SalesRecepeit{} = sales_recepeit) do
    Repo.delete(sales_recepeit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sales_recepeit changes.

  ## Examples

      iex> change_sales_recepeit(sales_recepeit)
      %Ecto.Changeset{data: %SalesRecepeit{}}

  """
  def change_sales_recepeit(%SalesRecepeit{} = sales_recepeit, attrs \\ %{}) do
    SalesRecepeit.changeset(sales_recepeit, attrs)
  end

  alias Store.Sales.ClotheOrder

  @doc """
  Returns the list of clothe_order.

  ## Examples

      iex> list_clothe_order()
      [%ClotheOrder{}, ...]

  """
  def list_clothe_order do
    current_mag = Confex.get_env(:store, :magazine)
    query = from orders in ClotheOrder,
     where: orders.magazine_id == ^current_mag
    Repo.all(query)
    |> Repo.preload([:magazine, :employee, clothe: [:colour, :size, :handbook]])
  end

  @doc """
  Gets a single clothe_order.

  Raises `Ecto.NoResultsError` if the Clothe order does not exist.

  ## Examples

      iex> get_clothe_order!(123)
      %ClotheOrder{}

      iex> get_clothe_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clothe_order!(id) do
    Repo.get!(ClotheOrder, id)
    |> Repo.preload([:magazine, :employee, clothe: [:colour, :size, :handbook]])
  end

  def get_clothe_order!(clothe_id, employee_id, magazine_id) do
    query = from orders in ClotheOrder,
    where: orders.magazine_id == ^magazine_id
    and orders.state == "ordered" and orders.clothe_id == ^clothe_id
    and orders.employee_id == ^employee_id,
    limit: 1
    Repo.all(query)
    |> List.first()
  end

  def clothe_orders_exists?(clothe_id) do
    current_mag = Confex.get_env(:store, :magazine)
    result = from orders in ClotheOrder,
     where: orders.magazine_id == ^current_mag and orders.state == "created" and orders.clothe_id == ^clothe_id
    Repo.all(result)
    |> Enum.empty?()
  end

  @doc """
  Creates a clothe_order.

  ## Examples

      iex> create_clothe_order(%{field: value})
      {:ok, %ClotheOrder{}}

      iex> create_clothe_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clothe_order(attrs \\ %{}) do
    %ClotheOrder{}
    |> ClotheOrder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clothe_order.

  ## Examples

      iex> update_clothe_order(clothe_order, %{field: new_value})
      {:ok, %ClotheOrder{}}

      iex> update_clothe_order(clothe_order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clothe_order(%ClotheOrder{} = clothe_order, attrs) do
    clothe_order
    |> ClotheOrder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clothe_order.

  ## Examples

      iex> delete_clothe_order(clothe_order)
      {:ok, %ClotheOrder{}}

      iex> delete_clothe_order(clothe_order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clothe_order(%ClotheOrder{} = clothe_order) do
    Repo.delete(clothe_order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clothe_order changes.

  ## Examples

      iex> change_clothe_order(clothe_order)
      %Ecto.Changeset{data: %ClotheOrder{}}

  """
  def change_clothe_order(%ClotheOrder{} = clothe_order, attrs \\ %{}) do
    ClotheOrder.changeset(clothe_order, attrs)
  end
end
