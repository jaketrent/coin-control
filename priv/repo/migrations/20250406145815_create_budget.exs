defmodule CoinControl.Repo.Migrations.CreateBudget do
  use Ecto.Migration

  def change do
    create table(:budget) do
      add :name, :string, default: "Budget", null: false
      add :start, :utc_datetime, null: false
      add :end, :utc_datetime, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
