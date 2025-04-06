defmodule CoinControlWeb.BudgetController do
  use CoinControlWeb, :controller

  alias CoinControl.Budgets
  alias CoinControl.Budgets.Budget

  def index(conn, _params) do
    budget = Budgets.list_budget()
    render(conn, :index, budget_collection: budget)
  end

  def new(conn, _params) do
    changeset = Budgets.change_budget(%Budget{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"budget" => budget_params}) do
    case Budgets.create_budget(budget_params) do
      {:ok, budget} ->
        conn
        |> put_flash(:info, "Budget created successfully.")
        |> redirect(to: ~p"/admin/budget/#{budget}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    budget = Budgets.get_budget!(id)
    render(conn, :show, budget: budget)
  end

  def edit(conn, %{"id" => id}) do
    budget = Budgets.get_budget!(id)
    changeset = Budgets.change_budget(budget)
    render(conn, :edit, budget: budget, changeset: changeset)
  end

  def update(conn, %{"id" => id, "budget" => budget_params}) do
    budget = Budgets.get_budget!(id)

    case Budgets.update_budget(budget, budget_params) do
      {:ok, budget} ->
        conn
        |> put_flash(:info, "Budget updated successfully.")
        |> redirect(to: ~p"/admin/budget/#{budget}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, budget: budget, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    budget = Budgets.get_budget!(id)
    {:ok, _budget} = Budgets.delete_budget(budget)

    conn
    |> put_flash(:info, "Budget deleted successfully.")
    |> redirect(to: ~p"/admin/budget")
  end
end
