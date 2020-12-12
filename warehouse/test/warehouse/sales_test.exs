defmodule Warehouse.SalesTest do
  use Warehouse.DataCase

  alias Warehouse.Sales

  describe "clothe_example" do
    alias Warehouse.Sales.ClotheExample

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def clothe_example_fixture(attrs \\ %{}) do
      {:ok, clothe_example} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_clothe_example()

      clothe_example
    end

    test "list_clothe_example/0 returns all clothe_example" do
      clothe_example = clothe_example_fixture()
      assert Sales.list_clothe_example() == [clothe_example]
    end

    test "get_clothe_example!/1 returns the clothe_example with given id" do
      clothe_example = clothe_example_fixture()
      assert Sales.get_clothe_example!(clothe_example.id) == clothe_example
    end

    test "create_clothe_example/1 with valid data creates a clothe_example" do
      assert {:ok, %ClotheExample{} = clothe_example} = Sales.create_clothe_example(@valid_attrs)
    end

    test "create_clothe_example/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_clothe_example(@invalid_attrs)
    end

    test "update_clothe_example/2 with valid data updates the clothe_example" do
      clothe_example = clothe_example_fixture()
      assert {:ok, %ClotheExample{} = clothe_example} = Sales.update_clothe_example(clothe_example, @update_attrs)
    end

    test "update_clothe_example/2 with invalid data returns error changeset" do
      clothe_example = clothe_example_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_clothe_example(clothe_example, @invalid_attrs)
      assert clothe_example == Sales.get_clothe_example!(clothe_example.id)
    end

    test "delete_clothe_example/1 deletes the clothe_example" do
      clothe_example = clothe_example_fixture()
      assert {:ok, %ClotheExample{}} = Sales.delete_clothe_example(clothe_example)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_clothe_example!(clothe_example.id) end
    end

    test "change_clothe_example/1 returns a clothe_example changeset" do
      clothe_example = clothe_example_fixture()
      assert %Ecto.Changeset{} = Sales.change_clothe_example(clothe_example)
    end
  end

  describe "clothe_in_store" do
    alias Warehouse.Sales.ClotheInStore

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def clothe_in_store_fixture(attrs \\ %{}) do
      {:ok, clothe_in_store} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_clothe_in_store()

      clothe_in_store
    end

    test "list_clothe_in_store/0 returns all clothe_in_store" do
      clothe_in_store = clothe_in_store_fixture()
      assert Sales.list_clothe_in_store() == [clothe_in_store]
    end

    test "get_clothe_in_store!/1 returns the clothe_in_store with given id" do
      clothe_in_store = clothe_in_store_fixture()
      assert Sales.get_clothe_in_store!(clothe_in_store.id) == clothe_in_store
    end

    test "create_clothe_in_store/1 with valid data creates a clothe_in_store" do
      assert {:ok, %ClotheInStore{} = clothe_in_store} = Sales.create_clothe_in_store(@valid_attrs)
      assert clothe_in_store.quantity == 42
    end

    test "create_clothe_in_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_clothe_in_store(@invalid_attrs)
    end

    test "update_clothe_in_store/2 with valid data updates the clothe_in_store" do
      clothe_in_store = clothe_in_store_fixture()
      assert {:ok, %ClotheInStore{} = clothe_in_store} = Sales.update_clothe_in_store(clothe_in_store, @update_attrs)
      assert clothe_in_store.quantity == 43
    end

    test "update_clothe_in_store/2 with invalid data returns error changeset" do
      clothe_in_store = clothe_in_store_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_clothe_in_store(clothe_in_store, @invalid_attrs)
      assert clothe_in_store == Sales.get_clothe_in_store!(clothe_in_store.id)
    end

    test "delete_clothe_in_store/1 deletes the clothe_in_store" do
      clothe_in_store = clothe_in_store_fixture()
      assert {:ok, %ClotheInStore{}} = Sales.delete_clothe_in_store(clothe_in_store)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_clothe_in_store!(clothe_in_store.id) end
    end

    test "change_clothe_in_store/1 returns a clothe_in_store changeset" do
      clothe_in_store = clothe_in_store_fixture()
      assert %Ecto.Changeset{} = Sales.change_clothe_in_store(clothe_in_store)
    end
  end

  describe "employee" do
    alias Warehouse.Sales.Employee

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_employee()

      employee
    end

    test "list_employee/0 returns all employee" do
      employee = employee_fixture()
      assert Sales.list_employee() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Sales.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Sales.create_employee(@valid_attrs)
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = Sales.update_employee(employee, @update_attrs)
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_employee(employee, @invalid_attrs)
      assert employee == Sales.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Sales.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Sales.change_employee(employee)
    end
  end

  describe "magazine" do
    alias Warehouse.Sales.Magazine

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def magazine_fixture(attrs \\ %{}) do
      {:ok, magazine} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_magazine()

      magazine
    end

    test "list_magazine/0 returns all magazine" do
      magazine = magazine_fixture()
      assert Sales.list_magazine() == [magazine]
    end

    test "get_magazine!/1 returns the magazine with given id" do
      magazine = magazine_fixture()
      assert Sales.get_magazine!(magazine.id) == magazine
    end

    test "create_magazine/1 with valid data creates a magazine" do
      assert {:ok, %Magazine{} = magazine} = Sales.create_magazine(@valid_attrs)
    end

    test "create_magazine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_magazine(@invalid_attrs)
    end

    test "update_magazine/2 with valid data updates the magazine" do
      magazine = magazine_fixture()
      assert {:ok, %Magazine{} = magazine} = Sales.update_magazine(magazine, @update_attrs)
    end

    test "update_magazine/2 with invalid data returns error changeset" do
      magazine = magazine_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_magazine(magazine, @invalid_attrs)
      assert magazine == Sales.get_magazine!(magazine.id)
    end

    test "delete_magazine/1 deletes the magazine" do
      magazine = magazine_fixture()
      assert {:ok, %Magazine{}} = Sales.delete_magazine(magazine)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_magazine!(magazine.id) end
    end

    test "change_magazine/1 returns a magazine changeset" do
      magazine = magazine_fixture()
      assert %Ecto.Changeset{} = Sales.change_magazine(magazine)
    end
  end
end
