defmodule CoinControlWeb.BudgetControllerTest do
  use CoinControlWeb.ConnCase

  import CoinControl.BudgetsFixtures

  @create_attrs %{
    name: "some name",
    start: ~U[2025-04-05 18:10:00Z],
    end: ~U[2025-04-05 18:10:00Z]
  }
  @update_attrs %{
    name: "some updated name",
    start: ~U[2025-04-06 18:10:00Z],
    end: ~U[2025-04-06 18:10:00Z]
  }
  @invalid_attrs %{name: nil, start: nil, end: nil}

  describe "index" do
    test "lists all budget", %{conn: conn} do
      conn = get(conn, ~p"/admin/budget")
      assert html_response(conn, 200) =~ "Listing Budget"
    end
  end

  describe "new budget" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/admin/budget/new")
      assert html_response(conn, 200) =~ "New Budget"
    end
  end

  describe "create budget" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/admin/budget", budget: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/admin/budget/#{id}"

      conn = get(conn, ~p"/admin/budget/#{id}")
      assert html_response(conn, 200) =~ "Budget #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/admin/budget", budget: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Budget"
    end
  end

  describe "edit budget" do
    setup [:create_budget]

    test "renders form for editing chosen budget", %{conn: conn, budget: budget} do
      conn = get(conn, ~p"/admin/budget/#{budget}/edit")
      assert html_response(conn, 200) =~ "Edit Budget"
    end
  end

  describe "update budget" do
    setup [:create_budget]

    test "redirects when data is valid", %{conn: conn, budget: budget} do
      conn = put(conn, ~p"/admin/budget/#{budget}", budget: @update_attrs)
      assert redirected_to(conn) == ~p"/admin/budget/#{budget}"

      conn = get(conn, ~p"/admin/budget/#{budget}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, budget: budget} do
      conn = put(conn, ~p"/admin/budget/#{budget}", budget: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Budget"
    end
  end

  describe "delete budget" do
    setup [:create_budget]

    test "deletes chosen budget", %{conn: conn, budget: budget} do
      conn = delete(conn, ~p"/admin/budget/#{budget}")
      assert redirected_to(conn) == ~p"/admin/budget"

      assert_error_sent 404, fn ->
        get(conn, ~p"/admin/budget/#{budget}")
      end
    end
  end

  defp create_budget(_) do
    budget = budget_fixture()
    %{budget: budget}
  end
end
