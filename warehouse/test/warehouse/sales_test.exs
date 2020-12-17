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

  describe "clothe_size" do
    alias Warehouse.Sales.ClotheSize

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def clothe_size_fixture(attrs \\ %{}) do
      {:ok, clothe_size} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_clothe_size()

      clothe_size
    end

    test "list_clothe_size/0 returns all clothe_size" do
      clothe_size = clothe_size_fixture()
      assert Sales.list_clothe_size() == [clothe_size]
    end

    test "get_clothe_size!/1 returns the clothe_size with given id" do
      clothe_size = clothe_size_fixture()
      assert Sales.get_clothe_size!(clothe_size.id) == clothe_size
    end

    test "create_clothe_size/1 with valid data creates a clothe_size" do
      assert {:ok, %ClotheSize{} = clothe_size} = Sales.create_clothe_size(@valid_attrs)
    end

    test "create_clothe_size/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_clothe_size(@invalid_attrs)
    end

    test "update_clothe_size/2 with valid data updates the clothe_size" do
      clothe_size = clothe_size_fixture()
      assert {:ok, %ClotheSize{} = clothe_size} = Sales.update_clothe_size(clothe_size, @update_attrs)
    end

    test "update_clothe_size/2 with invalid data returns error changeset" do
      clothe_size = clothe_size_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_clothe_size(clothe_size, @invalid_attrs)
      assert clothe_size == Sales.get_clothe_size!(clothe_size.id)
    end

    test "delete_clothe_size/1 deletes the clothe_size" do
      clothe_size = clothe_size_fixture()
      assert {:ok, %ClotheSize{}} = Sales.delete_clothe_size(clothe_size)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_clothe_size!(clothe_size.id) end
    end

    test "change_clothe_size/1 returns a clothe_size changeset" do
      clothe_size = clothe_size_fixture()
      assert %Ecto.Changeset{} = Sales.change_clothe_size(clothe_size)
    end
  end

  describe "clothe_colour" do
    alias Warehouse.Sales.ClotheColour

    @valid_attrs %{colour: "some colour"}
    @update_attrs %{colour: "some updated colour"}
    @invalid_attrs %{colour: nil}

    def clothe_colour_fixture(attrs \\ %{}) do
      {:ok, clothe_colour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_clothe_colour()

      clothe_colour
    end

    test "list_clothe_colour/0 returns all clothe_colour" do
      clothe_colour = clothe_colour_fixture()
      assert Sales.list_clothe_colour() == [clothe_colour]
    end

    test "get_clothe_colour!/1 returns the clothe_colour with given id" do
      clothe_colour = clothe_colour_fixture()
      assert Sales.get_clothe_colour!(clothe_colour.id) == clothe_colour
    end

    test "create_clothe_colour/1 with valid data creates a clothe_colour" do
      assert {:ok, %ClotheColour{} = clothe_colour} = Sales.create_clothe_colour(@valid_attrs)
      assert clothe_colour.colour == "some colour"
    end

    test "create_clothe_colour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_clothe_colour(@invalid_attrs)
    end

    test "update_clothe_colour/2 with valid data updates the clothe_colour" do
      clothe_colour = clothe_colour_fixture()
      assert {:ok, %ClotheColour{} = clothe_colour} = Sales.update_clothe_colour(clothe_colour, @update_attrs)
      assert clothe_colour.colour == "some updated colour"
    end

    test "update_clothe_colour/2 with invalid data returns error changeset" do
      clothe_colour = clothe_colour_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_clothe_colour(clothe_colour, @invalid_attrs)
      assert clothe_colour == Sales.get_clothe_colour!(clothe_colour.id)
    end

    test "delete_clothe_colour/1 deletes the clothe_colour" do
      clothe_colour = clothe_colour_fixture()
      assert {:ok, %ClotheColour{}} = Sales.delete_clothe_colour(clothe_colour)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_clothe_colour!(clothe_colour.id) end
    end

    test "change_clothe_colour/1 returns a clothe_colour changeset" do
      clothe_colour = clothe_colour_fixture()
      assert %Ecto.Changeset{} = Sales.change_clothe_colour(clothe_colour)
    end
  end

  describe "clothe_handbook" do
    alias Warehouse.Sales.ClotheHandbook

    @valid_attrs %{article: "some article", gender: "some gender", mark: "some mark", price: 42, type: "some type"}
    @update_attrs %{article: "some updated article", gender: "some updated gender", mark: "some updated mark", price: 43, type: "some updated type"}
    @invalid_attrs %{article: nil, gender: nil, mark: nil, price: nil, type: nil}

    def clothe_handbook_fixture(attrs \\ %{}) do
      {:ok, clothe_handbook} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_clothe_handbook()

      clothe_handbook
    end

    test "list_clothe_handbook/0 returns all clothe_handbook" do
      clothe_handbook = clothe_handbook_fixture()
      assert Sales.list_clothe_handbook() == [clothe_handbook]
    end

    test "get_clothe_handbook!/1 returns the clothe_handbook with given id" do
      clothe_handbook = clothe_handbook_fixture()
      assert Sales.get_clothe_handbook!(clothe_handbook.id) == clothe_handbook
    end

    test "create_clothe_handbook/1 with valid data creates a clothe_handbook" do
      assert {:ok, %ClotheHandbook{} = clothe_handbook} = Sales.create_clothe_handbook(@valid_attrs)
      assert clothe_handbook.article == "some article"
      assert clothe_handbook.gender == "some gender"
      assert clothe_handbook.mark == "some mark"
      assert clothe_handbook.price == 42
      assert clothe_handbook.type == "some type"
    end

    test "create_clothe_handbook/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_clothe_handbook(@invalid_attrs)
    end

    test "update_clothe_handbook/2 with valid data updates the clothe_handbook" do
      clothe_handbook = clothe_handbook_fixture()
      assert {:ok, %ClotheHandbook{} = clothe_handbook} = Sales.update_clothe_handbook(clothe_handbook, @update_attrs)
      assert clothe_handbook.article == "some updated article"
      assert clothe_handbook.gender == "some updated gender"
      assert clothe_handbook.mark == "some updated mark"
      assert clothe_handbook.price == 43
      assert clothe_handbook.type == "some updated type"
    end

    test "update_clothe_handbook/2 with invalid data returns error changeset" do
      clothe_handbook = clothe_handbook_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_clothe_handbook(clothe_handbook, @invalid_attrs)
      assert clothe_handbook == Sales.get_clothe_handbook!(clothe_handbook.id)
    end

    test "delete_clothe_handbook/1 deletes the clothe_handbook" do
      clothe_handbook = clothe_handbook_fixture()
      assert {:ok, %ClotheHandbook{}} = Sales.delete_clothe_handbook(clothe_handbook)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_clothe_handbook!(clothe_handbook.id) end
    end

    test "change_clothe_handbook/1 returns a clothe_handbook changeset" do
      clothe_handbook = clothe_handbook_fixture()
      assert %Ecto.Changeset{} = Sales.change_clothe_handbook(clothe_handbook)
    end
  end

  describe "sales_recepeit" do
    alias Warehouse.Sales.SalesRecepeit

    @valid_attrs %{cashbox_num: 42, quantity: 42, sold_date: ~D[2010-04-17], sum: 42}
    @update_attrs %{cashbox_num: 43, quantity: 43, sold_date: ~D[2011-05-18], sum: 43}
    @invalid_attrs %{cashbox_num: nil, quantity: nil, sold_date: nil, sum: nil}

    def sales_recepeit_fixture(attrs \\ %{}) do
      {:ok, sales_recepeit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_sales_recepeit()

      sales_recepeit
    end

    test "list_sales_recepeit/0 returns all sales_recepeit" do
      sales_recepeit = sales_recepeit_fixture()
      assert Sales.list_sales_recepeit() == [sales_recepeit]
    end

    test "get_sales_recepeit!/1 returns the sales_recepeit with given id" do
      sales_recepeit = sales_recepeit_fixture()
      assert Sales.get_sales_recepeit!(sales_recepeit.id) == sales_recepeit
    end

    test "create_sales_recepeit/1 with valid data creates a sales_recepeit" do
      assert {:ok, %SalesRecepeit{} = sales_recepeit} = Sales.create_sales_recepeit(@valid_attrs)
      assert sales_recepeit.cashbox_num == 42
      assert sales_recepeit.quantity == 42
      assert sales_recepeit.sold_date == ~D[2010-04-17]
      assert sales_recepeit.sum == 42
    end

    test "create_sales_recepeit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_sales_recepeit(@invalid_attrs)
    end

    test "update_sales_recepeit/2 with valid data updates the sales_recepeit" do
      sales_recepeit = sales_recepeit_fixture()
      assert {:ok, %SalesRecepeit{} = sales_recepeit} = Sales.update_sales_recepeit(sales_recepeit, @update_attrs)
      assert sales_recepeit.cashbox_num == 43
      assert sales_recepeit.quantity == 43
      assert sales_recepeit.sold_date == ~D[2011-05-18]
      assert sales_recepeit.sum == 43
    end

    test "update_sales_recepeit/2 with invalid data returns error changeset" do
      sales_recepeit = sales_recepeit_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_sales_recepeit(sales_recepeit, @invalid_attrs)
      assert sales_recepeit == Sales.get_sales_recepeit!(sales_recepeit.id)
    end

    test "delete_sales_recepeit/1 deletes the sales_recepeit" do
      sales_recepeit = sales_recepeit_fixture()
      assert {:ok, %SalesRecepeit{}} = Sales.delete_sales_recepeit(sales_recepeit)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_sales_recepeit!(sales_recepeit.id) end
    end

    test "change_sales_recepeit/1 returns a sales_recepeit changeset" do
      sales_recepeit = sales_recepeit_fixture()
      assert %Ecto.Changeset{} = Sales.change_sales_recepeit(sales_recepeit)
    end
  end
end
