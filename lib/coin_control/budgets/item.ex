defmodule CoinControl.Budgets.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item" do
    field :name, :string
    field :order, :integer
    field :group_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :order])
    |> validate_required([:name, :order])
  end
end
