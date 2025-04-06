defmodule CoinControlWeb.BudgetItemHTML do
  use CoinControlWeb, :html

  embed_templates "budget_item_html/*"

  @doc """
  Renders a budget_item form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def budget_item_form(assigns)

  def budget_opts(changeset) do
    existing_budget = Ecto.Changeset.get_change(changeset, :budget)
    dbg(existing_budget)

    for budget <- CoinControl.Budgets.list_budget() do
      [
        key: budget.name,
        value: budget.id,
        selected: existing_budget.data != nil and budget.id == existing_budget.data.id
      ]
    end
  end

  def item_opts(changeset) do
    existing_item = Ecto.Changeset.get_change(changeset, :item)

    for item <- CoinControl.Budgets.list_item() do
      [
        key: item.name,
        value: item.id,
        selected: existing_item.data != nil and item.id == existing_item.data.id
      ]
    end
  end
end
