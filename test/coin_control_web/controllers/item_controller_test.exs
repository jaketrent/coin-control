defmodule CoinControlWeb.ItemControllerTest do
  use CoinControlWeb.ConnCase

  import CoinControl.BudgetsFixtures

  @create_attrs %{name: "some name", order: 42}
  @update_attrs %{name: "some updated name", order: 43}
  @invalid_attrs %{name: nil, order: nil}

  describe "index" do
    test "lists all item", %{conn: conn} do
      conn = get(conn, ~p"/admin/item")
      assert html_response(conn, 200) =~ "Listing Item"
    end
  end

  describe "new item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/item/new")
      assert html_response(conn, 200) =~ "New Item"
    end
  end

  describe "create item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/item", item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/item/#{id}"

      conn = get(conn, ~p"/admin/item/#{id}")
      assert html_response(conn, 200) =~ "Item #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/item", item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Item"
    end
  end

  describe "edit item" do
    setup [:create_item]

    test "renders form for editing chosen item", %{conn: conn, item: item} do
      conn = get(conn, ~p"/admin/item/#{item}/edit")
      assert html_response(conn, 200) =~ "Edit Item"
    end
  end

  describe "update item" do
    setup [:create_item]

    test "redirects when data is valid", %{conn: conn, item: item} do
      conn = put(conn, ~p"/admin/item/#{item}", item: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/item/#{item}"

      conn = get(conn, ~p"/admin/item/#{item}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, item: item} do
      conn = put(conn, ~p"/admin/item/#{item}", item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Item"
    end
  end

  describe "delete item" do
    setup [:create_item]

    test "deletes chosen item", %{conn: conn, item: item} do
      conn = delete(conn, ~p"/admin/item/#{item}")
      assert redirected_to(conn) == ~p"/admin/item"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/item/#{item}")
      end
    end
  end

  defp create_item(_) do
    item = item_fixture()
    %{item: item}
  end
end
