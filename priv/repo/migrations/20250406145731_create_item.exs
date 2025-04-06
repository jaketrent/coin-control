defmodule CoinControl.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:item) do
      add :name, :string
      add :order, :integer
      add :group_id, references(:group, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:item, [:group_id])
  end
end
