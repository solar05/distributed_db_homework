defmodule WarehouseWeb.:"Elixir.Size:string.ClotheSize"ControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:clothe_size) do
    {:ok, clothe_size} = Sales.create_clothe_size(@create_attrs)
    clothe_size
  end

  describe "index" do
    test "lists all clothe_size", %{conn: conn} do
      conn = get(conn, Routes.size:string_clothe_size_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothe size"
    end
  end

  describe "new clothe_size" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.size:string_clothe_size_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothe size"
    end
  end

  describe "create clothe_size" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.size:string_clothe_size_path(conn, :create), clothe_size: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.size:string_clothe_size_path(conn, :show, id)

      conn = get(conn, Routes.size:string_clothe_size_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothe size"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.size:string_clothe_size_path(conn, :create), clothe_size: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothe size"
    end
  end

  describe "edit clothe_size" do
    setup [:create_clothe_size]

    test "renders form for editing chosen clothe_size", %{conn: conn, clothe_size: clothe_size} do
      conn = get(conn, Routes.size:string_clothe_size_path(conn, :edit, clothe_size))
      assert html_response(conn, 200) =~ "Edit Clothe size"
    end
  end

  describe "update clothe_size" do
    setup [:create_clothe_size]

    test "redirects when data is valid", %{conn: conn, clothe_size: clothe_size} do
      conn = put(conn, Routes.size:string_clothe_size_path(conn, :update, clothe_size), clothe_size: @update_attrs)
      assert redirected_to(conn) == Routes.size:string_clothe_size_path(conn, :show, clothe_size)

      conn = get(conn, Routes.size:string_clothe_size_path(conn, :show, clothe_size))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, clothe_size: clothe_size} do
      conn = put(conn, Routes.size:string_clothe_size_path(conn, :update, clothe_size), clothe_size: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothe size"
    end
  end

  describe "delete clothe_size" do
    setup [:create_clothe_size]

    test "deletes chosen clothe_size", %{conn: conn, clothe_size: clothe_size} do
      conn = delete(conn, Routes.size:string_clothe_size_path(conn, :delete, clothe_size))
      assert redirected_to(conn) == Routes.size:string_clothe_size_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.size:string_clothe_size_path(conn, :show, clothe_size))
      end
    end
  end

  defp create_clothe_size(_) do
    clothe_size = fixture(:clothe_size)
    %{clothe_size: clothe_size}
  end
end
