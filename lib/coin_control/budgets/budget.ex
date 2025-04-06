defmodule CoinControl.Budgets.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budget" do
    field :name, :string
    field :start, :utc_datetime
    field :end, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:name, :start, :end])
    |> validate_required([:name, :start, :end])
  end
end
