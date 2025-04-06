defmodule CoinControlWeb.BudgetItemControllerTest do
  use CoinControlWeb.ConnCase

  import CoinControl.BudgetsFixtures

  @create_attrs %{actual: "120.5", expected: "120.5", enveloped: true}
  @update_attrs %{actual: "456.7", expected: "456.7", enveloped: false}
  @invalid_attrs %{actual: nil, expected: nil, enveloped: nil}

  describe "index" do
    test "lists all budget_item", %{conn: conn} do
      conn = get(conn, ~p"/admin/budget-item")
      assert html_response(conn, 200) =~ "Listing Budget item"
    end
  end

  describe "new budget_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/budget-item/new")
      assert html_response(conn, 200) =~ "New Budget item"
    end
  end

  describe "create budget_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/budget-item", budget_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/budget-item/#{id}"

      conn = get(conn, ~p"/admin/budget-item/#{id}")
      assert html_response(conn, 200) =~ "Budget item #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/budget-item", budget_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Budget item"
    end
  end

  describe "edit budget_item" do
    setup [:create_budget_item]

    test "renders form for editing chosen budget_item", %{conn: conn, budget_item: budget_item} do
      conn = get(conn, ~p"/admin/budget-item/#{budget_item}/edit")
      assert html_response(conn, 200) =~ "Edit Budget item"
    end
  end

  describe "update budget_item" do
    setup [:create_budget_item]

    test "redirects when data is valid", %{conn: conn, budget_item: budget_item} do
      conn = put(conn, ~p"/admin/budget-item/#{budget_item}", budget_item: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/budget-item/#{budget_item}"

      conn = get(conn, ~p"/admin/budget-item/#{budget_item}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, budget_item: budget_item} do
      conn = put(conn, ~p"/admin/budget-item/#{budget_item}", budget_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Budget item"
    end
  end

  describe "delete budget_item" do
    setup [:create_budget_item]

    test "deletes chosen budget_item", %{conn: conn, budget_item: budget_item} do
      conn = delete(conn, ~p"/admin/budget-item/#{budget_item}")
      assert redirected_to(conn) == ~p"/admin/budget-item"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/budget-item/#{budget_item}")
      end
    end
  end

  defp create_budget_item(_) do
    budget_item = budget_item_fixture()
    %{budget_item: budget_item}
  end
end
