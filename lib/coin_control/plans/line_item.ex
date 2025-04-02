defmodule CoinControl.Plans.LineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "line_item" do
    field :expected, :decimal
    field :order, :integer
    field :enveloped, :boolean, default: false
    field :group_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:order, :expected, :enveloped])
    |> validate_required([:order, :expected, :enveloped])
  end
end
