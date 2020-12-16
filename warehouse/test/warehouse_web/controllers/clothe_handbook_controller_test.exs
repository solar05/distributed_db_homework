defmodule WarehouseWeb.ClotheHandbookControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{article: "some article", gender: "some gender", mark: "some mark", price: 42, type: "some type"}
  @update_attrs %{article: "some updated article", gender: "some updated gender", mark: "some updated mark", price: 43, type: "some updated type"}
  @invalid_attrs %{article: nil, gender: nil, mark: nil, price: nil, type: nil}

  def fixture(:clothe_handbook) do
    {:ok, clothe_handbook} = Sales.create_clothe_handbook(@create_attrs)
    clothe_handbook
  end

  describe "index" do
    test "lists all clothe_handbook", %{conn: conn} do
      conn = get(conn, Routes.clothe_handbook_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothe handbook"
    end
  end

  describe "new clothe_handbook" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clothe_handbook_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothe handbook"
    end
  end

  describe "create clothe_handbook" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clothe_handbook_path(conn, :create), clothe_handbook: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clothe_handbook_path(conn, :show, id)

      conn = get(conn, Routes.clothe_handbook_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothe handbook"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clothe_handbook_path(conn, :create), clothe_handbook: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothe handbook"
    end
  end

  describe "edit clothe_handbook" do
    setup [:create_clothe_handbook]

    test "renders form for editing chosen clothe_handbook", %{conn: conn, clothe_handbook: clothe_handbook} do
      conn = get(conn, Routes.clothe_handbook_path(conn, :edit, clothe_handbook))
      assert html_response(conn, 200) =~ "Edit Clothe handbook"
    end
  end

  describe "update clothe_handbook" do
    setup [:create_clothe_handbook]

    test "redirects when data is valid", %{conn: conn, clothe_handbook: clothe_handbook} do
      conn = put(conn, Routes.clothe_handbook_path(conn, :update, clothe_handbook), clothe_handbook: @update_attrs)
      assert redirected_to(conn) == Routes.clothe_handbook_path(conn, :show, clothe_handbook)

      conn = get(conn, Routes.clothe_handbook_path(conn, :show, clothe_handbook))
      assert html_response(conn, 200) =~ "some updated article"
    end

    test "renders errors when data is invalid", %{conn: conn, clothe_handbook: clothe_handbook} do
      conn = put(conn, Routes.clothe_handbook_path(conn, :update, clothe_handbook), clothe_handbook: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothe handbook"
    end
  end

  describe "delete clothe_handbook" do
    setup [:create_clothe_handbook]

    test "deletes chosen clothe_handbook", %{conn: conn, clothe_handbook: clothe_handbook} do
      conn = delete(conn, Routes.clothe_handbook_path(conn, :delete, clothe_handbook))
      assert redirected_to(conn) == Routes.clothe_handbook_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.clothe_handbook_path(conn, :show, clothe_handbook))
      end
    end
  end

  defp create_clothe_handbook(_) do
    clothe_handbook = fixture(:clothe_handbook)
    %{clothe_handbook: clothe_handbook}
  end
end
