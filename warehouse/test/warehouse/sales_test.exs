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
end
