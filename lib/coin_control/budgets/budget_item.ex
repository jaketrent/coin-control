defmodule CoinControl.Budgets.BudgetItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budget_item" do
    field :actual, :decimal
    field :expected, :decimal
    field :enveloped, :boolean, default: false
    field :budget_id, :id
    field :item_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget_item, attrs) do
    budget_item
    |> cast(attrs, [:actual, :expected, :enveloped])
    |> validate_required([:actual, :expected, :enveloped])
  end
end
