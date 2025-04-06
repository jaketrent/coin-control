defmodule CoinControl.Repo.Migrations.CreateBudgetItem do
  use Ecto.Migration

  def change do
    create table(:budget_item) do
      add :actual, :decimal, precision: 15, scale: 6
      add :expected, :decimal, precision: 15, scale: 6
      add :enveloped, :boolean, default: false, null: false
      add :budget_id, references(:budget, on_delete: :delete_all)
      add :item_id, references(:item, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:budget_item, [:item_id])
    create unique_index(:budget_item, [:budget_id, :item_id])
  end
end
