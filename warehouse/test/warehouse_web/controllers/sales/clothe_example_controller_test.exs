defmodule WarehouseWeb.Sales.ClotheExampleControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:clothe_example) do
    {:ok, clothe_example} = Sales.create_clothe_example(@create_attrs)
    clothe_example
  end

  describe "index" do
    test "lists all clothe_example", %{conn: conn} do
      conn = get(conn, Routes.sales_clothe_example_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothe example"
    end
  end

  describe "new clothe_example" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sales_clothe_example_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothe example"
    end
  end

  describe "create clothe_example" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sales_clothe_example_path(conn, :create), clothe_example: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sales_clothe_example_path(conn, :show, id)

      conn = get(conn, Routes.sales_clothe_example_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothe example"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sales_clothe_example_path(conn, :create), clothe_example: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothe example"
    end
  end

  describe "edit clothe_example" do
    setup [:create_clothe_example]

    test "renders form for editing chosen clothe_example", %{conn: conn, clothe_example: clothe_example} do
      conn = get(conn, Routes.sales_clothe_example_path(conn, :edit, clothe_example))
      assert html_response(conn, 200) =~ "Edit Clothe example"
    end
  end

  describe "update clothe_example" do
    setup [:create_clothe_example]

    test "redirects when data is valid", %{conn: conn, clothe_example: clothe_example} do
      conn = put(conn, Routes.sales_clothe_example_path(conn, :update, clothe_example), clothe_example: @update_attrs)
      assert redirected_to(conn) == Routes.sales_clothe_example_path(conn, :show, clothe_example)

      conn = get(conn, Routes.sales_clothe_example_path(conn, :show, clothe_example))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, clothe_example: clothe_example} do
      conn = put(conn, Routes.sales_clothe_example_path(conn, :update, clothe_example), clothe_example: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothe example"
    end
  end

  describe "delete clothe_example" do
    setup [:create_clothe_example]

    test "deletes chosen clothe_example", %{conn: conn, clothe_example: clothe_example} do
      conn = delete(conn, Routes.sales_clothe_example_path(conn, :delete, clothe_example))
      assert redirected_to(conn) == Routes.sales_clothe_example_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sales_clothe_example_path(conn, :show, clothe_example))
      end
    end
  end

  defp create_clothe_example(_) do
    clothe_example = fixture(:clothe_example)
    %{clothe_example: clothe_example}
  end
end
