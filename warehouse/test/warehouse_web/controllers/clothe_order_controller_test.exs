defmodule WarehouseWeb.ClotheOrderControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{order_date: ~D[2010-04-17], quantity: 42, state: "some state"}
  @update_attrs %{order_date: ~D[2011-05-18], quantity: 43, state: "some updated state"}
  @invalid_attrs %{order_date: nil, quantity: nil, state: nil}

  def fixture(:clothe_order) do
    {:ok, clothe_order} = Sales.create_clothe_order(@create_attrs)
    clothe_order
  end

  describe "index" do
    test "lists all clothe_order", %{conn: conn} do
      conn = get(conn, Routes.clothe_order_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothe order"
    end
  end

  describe "new clothe_order" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clothe_order_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothe order"
    end
  end

  describe "create clothe_order" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clothe_order_path(conn, :create), clothe_order: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clothe_order_path(conn, :show, id)

      conn = get(conn, Routes.clothe_order_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothe order"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clothe_order_path(conn, :create), clothe_order: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothe order"
    end
  end

  describe "edit clothe_order" do
    setup [:create_clothe_order]

    test "renders form for editing chosen clothe_order", %{conn: conn, clothe_order: clothe_order} do
      conn = get(conn, Routes.clothe_order_path(conn, :edit, clothe_order))
      assert html_response(conn, 200) =~ "Edit Clothe order"
    end
  end

  describe "update clothe_order" do
    setup [:create_clothe_order]

    test "redirects when data is valid", %{conn: conn, clothe_order: clothe_order} do
      conn = put(conn, Routes.clothe_order_path(conn, :update, clothe_order), clothe_order: @update_attrs)
      assert redirected_to(conn) == Routes.clothe_order_path(conn, :show, clothe_order)

      conn = get(conn, Routes.clothe_order_path(conn, :show, clothe_order))
      assert html_response(conn, 200) =~ "some updated state"
    end

    test "renders errors when data is invalid", %{conn: conn, clothe_order: clothe_order} do
      conn = put(conn, Routes.clothe_order_path(conn, :update, clothe_order), clothe_order: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothe order"
    end
  end

  describe "delete clothe_order" do
    setup [:create_clothe_order]

    test "deletes chosen clothe_order", %{conn: conn, clothe_order: clothe_order} do
      conn = delete(conn, Routes.clothe_order_path(conn, :delete, clothe_order))
      assert redirected_to(conn) == Routes.clothe_order_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.clothe_order_path(conn, :show, clothe_order))
      end
    end
  end

  defp create_clothe_order(_) do
    clothe_order = fixture(:clothe_order)
    %{clothe_order: clothe_order}
  end
end
