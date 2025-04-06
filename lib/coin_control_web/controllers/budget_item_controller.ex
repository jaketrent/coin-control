defmodule CoinControlWeb.BudgetItemController do
  use CoinControlWeb, :controller

  alias CoinControl.Budgets
  alias CoinControl.Budgets.BudgetItem

  def index(conn, _params) do
    budget_item = Budgets.list_budget_item()
    render(conn, :index, budget_item_collection: budget_item)
  end

  def new(conn, _params) do
    changeset = Budgets.change_budget_item(%BudgetItem{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"budget_item" => budget_item_params}) do
    case Budgets.create_budget_item(budget_item_params) do
      {:ok, budget_item} ->
        conn
        |> put_flash(:info, "Budget item created successfully.")
        |> redirect(to: ~p"/admin/budget-item/#{budget_item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    budget_item = Budgets.get_budget_item!(id)
    render(conn, :show, budget_item: budget_item)
  end

  def edit(conn, %{"id" => id}) do
    budget_item = Budgets.get_budget_item!(id)
    changeset = Budgets.change_budget_item(budget_item)
    render(conn, :edit, budget_item: budget_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "budget_item" => budget_item_params}) do
    budget_item = Budgets.get_budget_item!(id)

    case Budgets.update_budget_item(budget_item, budget_item_params) do
      {:ok, budget_item} ->
        conn
        |> put_flash(:info, "Budget item updated successfully.")
        |> redirect(to: ~p"/admin/budget-item/#{budget_item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, budget_item: budget_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    budget_item = Budgets.get_budget_item!(id)
    {:ok, _budget_item} = Budgets.delete_budget_item(budget_item)

    conn
    |> put_flash(:info, "Budget item deleted successfully.")
    |> redirect(to: ~p"/admin/budget-item")
  end
end
