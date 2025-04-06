defmodule CoinControlWeb.GroupControllerTest do
  use CoinControlWeb.ConnCase

  import CoinControl.BudgetsFixtures

  @create_attrs %{name: "some name", order: 42}
  @update_attrs %{name: "some updated name", order: 43}
  @invalid_attrs %{name: nil, order: nil}

  describe "index" do
    test "lists all group", %{conn: conn} do
      conn = get(conn, ~p"/admin/group")
      assert html_response(conn, 200) =~ "Listing Group"
    end
  end

  describe "new group" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/group/new")
      assert html_response(conn, 200) =~ "New Group"
    end
  end

  describe "create group" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/group", group: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/group/#{id}"

      conn = get(conn, ~p"/admin/group/#{id}")
      assert html_response(conn, 200) =~ "Group #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/group", group: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Group"
    end
  end

  describe "edit group" do
    setup [:create_group]

    test "renders form for editing chosen group", %{conn: conn, group: group} do
      conn = get(conn, ~p"/admin/group/#{group}/edit")
      assert html_response(conn, 200) =~ "Edit Group"
    end
  end

  describe "update group" do
    setup [:create_group]

    test "redirects when data is valid", %{conn: conn, group: group} do
      conn = put(conn, ~p"/admin/group/#{group}", group: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/group/#{group}"

      conn = get(conn, ~p"/admin/group/#{group}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, group: group} do
      conn = put(conn, ~p"/admin/group/#{group}", group: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Group"
    end
  end

  describe "delete group" do
    setup [:create_group]

    test "deletes chosen group", %{conn: conn, group: group} do
      conn = delete(conn, ~p"/admin/group/#{group}")
      assert redirected_to(conn) == ~p"/admin/group"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/group/#{group}")
      end
    end
  end

  defp create_group(_) do
    group = group_fixture()
    %{group: group}
  end
end
