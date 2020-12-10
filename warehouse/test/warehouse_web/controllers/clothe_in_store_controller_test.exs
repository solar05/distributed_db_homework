defmodule WarehouseWeb.ClotheInStoreControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{quantity: 42}
  @update_attrs %{quantity: 43}
  @invalid_attrs %{quantity: nil}

  def fixture(:clothe_in_store) do
    {:ok, clothe_in_store} = Sales.create_clothe_in_store(@create_attrs)
    clothe_in_store
  end

  describe "index" do
    test "lists all clothe_in_store", %{conn: conn} do
      conn = get(conn, Routes.clothe_in_store_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothe in store"
    end
  end

  describe "new clothe_in_store" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clothe_in_store_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothe in store"
    end
  end

  describe "create clothe_in_store" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clothe_in_store_path(conn, :create), clothe_in_store: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clothe_in_store_path(conn, :show, id)

      conn = get(conn, Routes.clothe_in_store_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothe in store"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clothe_in_store_path(conn, :create), clothe_in_store: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothe in store"
    end
  end

  describe "edit clothe_in_store" do
    setup [:create_clothe_in_store]

    test "renders form for editing chosen clothe_in_store", %{conn: conn, clothe_in_store: clothe_in_store} do
      conn = get(conn, Routes.clothe_in_store_path(conn, :edit, clothe_in_store))
      assert html_response(conn, 200) =~ "Edit Clothe in store"
    end
  end

  describe "update clothe_in_store" do
    setup [:create_clothe_in_store]

    test "redirects when data is valid", %{conn: conn, clothe_in_store: clothe_in_store} do
      conn = put(conn, Routes.clothe_in_store_path(conn, :update, clothe_in_store), clothe_in_store: @update_attrs)
      assert redirected_to(conn) == Routes.clothe_in_store_path(conn, :show, clothe_in_store)

      conn = get(conn, Routes.clothe_in_store_path(conn, :show, clothe_in_store))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, clothe_in_store: clothe_in_store} do
      conn = put(conn, Routes.clothe_in_store_path(conn, :update, clothe_in_store), clothe_in_store: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothe in store"
    end
  end

  describe "delete clothe_in_store" do
    setup [:create_clothe_in_store]

    test "deletes chosen clothe_in_store", %{conn: conn, clothe_in_store: clothe_in_store} do
      conn = delete(conn, Routes.clothe_in_store_path(conn, :delete, clothe_in_store))
      assert redirected_to(conn) == Routes.clothe_in_store_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.clothe_in_store_path(conn, :show, clothe_in_store))
      end
    end
  end

  defp create_clothe_in_store(_) do
    clothe_in_store = fixture(:clothe_in_store)
    %{clothe_in_store: clothe_in_store}
  end
end
