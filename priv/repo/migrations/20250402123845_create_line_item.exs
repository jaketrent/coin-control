defmodule CoinControl.Repo.Migrations.CreateLineItem do
  use Ecto.Migration

  def change do
    create table(:line_item) do
      add :order, :integer
      add :expected, :decimal
      add :enveloped, :boolean, default: false, null: false
      add :group_id, references(:group, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:line_item, [:group_id])
  end
end
