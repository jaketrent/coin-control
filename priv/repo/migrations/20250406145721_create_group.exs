defmodule CoinControl.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:group) do
      add :name, :string, null: false
      add :order, :integer, default: 1

      timestamps(type: :utc_datetime)
    end
  end
end
