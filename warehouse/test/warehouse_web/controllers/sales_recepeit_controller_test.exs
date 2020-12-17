defmodule WarehouseWeb.SalesRecepeitControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{cashbox_num: 42, quantity: 42, sold_date: ~D[2010-04-17], sum: 42}
  @update_attrs %{cashbox_num: 43, quantity: 43, sold_date: ~D[2011-05-18], sum: 43}
  @invalid_attrs %{cashbox_num: nil, quantity: nil, sold_date: nil, sum: nil}

  def fixture(:sales_recepeit) do
    {:ok, sales_recepeit} = Sales.create_sales_recepeit(@create_attrs)
    sales_recepeit
  end

  describe "index" do
    test "lists all sales_recepeit", %{conn: conn} do
      conn = get(conn, Routes.sales_recepeit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sales recepeit"
    end
  end

  describe "new sales_recepeit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sales_recepeit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sales recepeit"
    end
  end

  describe "create sales_recepeit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sales_recepeit_path(conn, :create), sales_recepeit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sales_recepeit_path(conn, :show, id)

      conn = get(conn, Routes.sales_recepeit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sales recepeit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sales_recepeit_path(conn, :create), sales_recepeit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sales recepeit"
    end
  end

  describe "edit sales_recepeit" do
    setup [:create_sales_recepeit]

    test "renders form for editing chosen sales_recepeit", %{conn: conn, sales_recepeit: sales_recepeit} do
      conn = get(conn, Routes.sales_recepeit_path(conn, :edit, sales_recepeit))
      assert html_response(conn, 200) =~ "Edit Sales recepeit"
    end
  end

  describe "update sales_recepeit" do
    setup [:create_sales_recepeit]

    test "redirects when data is valid", %{conn: conn, sales_recepeit: sales_recepeit} do
      conn = put(conn, Routes.sales_recepeit_path(conn, :update, sales_recepeit), sales_recepeit: @update_attrs)
      assert redirected_to(conn) == Routes.sales_recepeit_path(conn, :show, sales_recepeit)

      conn = get(conn, Routes.sales_recepeit_path(conn, :show, sales_recepeit))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, sales_recepeit: sales_recepeit} do
      conn = put(conn, Routes.sales_recepeit_path(conn, :update, sales_recepeit), sales_recepeit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sales recepeit"
    end
  end

  describe "delete sales_recepeit" do
    setup [:create_sales_recepeit]

    test "deletes chosen sales_recepeit", %{conn: conn, sales_recepeit: sales_recepeit} do
      conn = delete(conn, Routes.sales_recepeit_path(conn, :delete, sales_recepeit))
      assert redirected_to(conn) == Routes.sales_recepeit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sales_recepeit_path(conn, :show, sales_recepeit))
      end
    end
  end

  defp create_sales_recepeit(_) do
    sales_recepeit = fixture(:sales_recepeit)
    %{sales_recepeit: sales_recepeit}
  end
end
