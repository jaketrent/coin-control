defmodule CoinControl.Budgets.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "group" do
    field :name, :string
    field :order, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :order])
    |> validate_required([:name, :order])
  end
end
