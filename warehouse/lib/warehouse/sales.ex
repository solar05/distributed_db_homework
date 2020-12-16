defmodule Warehouse.Sales do
  @moduledoc """
  The Sales context.
  """

  import Ecto.Query, warn: false
  alias Warehouse.Repo

  alias Warehouse.Sales.ClotheExample

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

  alias Warehouse.Sales.ClotheInStore

  @doc """
  Returns the list of clothe_in_store.

  ## Examples

      iex> list_clothe_in_store()
      [%ClotheInStore{}, ...]

  """
  def list_clothe_in_store do
    current_mag = Confex.get_env(:warehouse, :magazine)
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
  def get_clothe_in_store!(id), do: Repo.get!(ClotheInStore, id)

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
    |> ClotheInStore.changeset(attrs)
    |> Repo.update()
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

  alias Warehouse.Sales.Employee

  @doc """
  Returns the list of employee.

  ## Examples

      iex> list_employee()
      [%Employee{}, ...]

  """
  def list_employee do
    Repo.all(Employee)
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
    current_mag = Confex.get_env(:warehouse, :magazine)
    Repo.get_by(Employee, [first_name: name, magazine_id: current_mag])
  end

  alias Warehouse.Sales.Magazine

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

  alias Warehouse.Sales.ClotheSize

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

  alias Warehouse.Sales.ClotheColour

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

  alias Warehouse.Sales.ClotheHandbook

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
end
