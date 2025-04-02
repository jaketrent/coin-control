defmodule CoinControl.Plans.Template do
  use Ecto.Schema
  import Ecto.Changeset

  schema "template" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(template, attrs) do
    template
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
