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
    Repo.all(ClotheInStore)
  end

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
end
