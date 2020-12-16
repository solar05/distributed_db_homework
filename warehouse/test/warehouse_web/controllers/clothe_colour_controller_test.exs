defmodule WarehouseWeb.ClotheColourControllerTest do
  use WarehouseWeb.ConnCase

  alias Warehouse.Sales

  @create_attrs %{colour: "some colour"}
  @update_attrs %{colour: "some updated colour"}
  @invalid_attrs %{colour: nil}

  def fixture(:clothe_colour) do
    {:ok, clothe_colour} = Sales.create_clothe_colour(@create_attrs)
    clothe_colour
  end

  describe "index" do
    test "lists all clothe_colour", %{conn: conn} do
      conn = get(conn, Routes.clothe_colour_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clothe colour"
    end
  end

  describe "new clothe_colour" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clothe_colour_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clothe colour"
    end
  end

  describe "create clothe_colour" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clothe_colour_path(conn, :create), clothe_colour: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clothe_colour_path(conn, :show, id)

      conn = get(conn, Routes.clothe_colour_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clothe colour"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clothe_colour_path(conn, :create), clothe_colour: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothe colour"
    end
  end

  describe "edit clothe_colour" do
    setup [:create_clothe_colour]

    test "renders form for editing chosen clothe_colour", %{conn: conn, clothe_colour: clothe_colour} do
      conn = get(conn, Routes.clothe_colour_path(conn, :edit, clothe_colour))
      assert html_response(conn, 200) =~ "Edit Clothe colour"
    end
  end

  describe "update clothe_colour" do
    setup [:create_clothe_colour]

    test "redirects when data is valid", %{conn: conn, clothe_colour: clothe_colour} do
      conn = put(conn, Routes.clothe_colour_path(conn, :update, clothe_colour), clothe_colour: @update_attrs)
      assert redirected_to(conn) == Routes.clothe_colour_path(conn, :show, clothe_colour)

      conn = get(conn, Routes.clothe_colour_path(conn, :show, clothe_colour))
      assert html_response(conn, 200) =~ "some updated colour"
    end

    test "renders errors when data is invalid", %{conn: conn, clothe_colour: clothe_colour} do
      conn = put(conn, Routes.clothe_colour_path(conn, :update, clothe_colour), clothe_colour: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothe colour"
    end
  end

  describe "delete clothe_colour" do
    setup [:create_clothe_colour]

    test "deletes chosen clothe_colour", %{conn: conn, clothe_colour: clothe_colour} do
      conn = delete(conn, Routes.clothe_colour_path(conn, :delete, clothe_colour))
      assert redirected_to(conn) == Routes.clothe_colour_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.clothe_colour_path(conn, :show, clothe_colour))
      end
    end
  end

  defp create_clothe_colour(_) do
    clothe_colour = fixture(:clothe_colour)
    %{clothe_colour: clothe_colour}
  end
end
