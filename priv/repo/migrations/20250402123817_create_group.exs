defmodule CoinControl.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:group) do
      add :name, :string
      add :order, :integer
      add :template_id, references(:template, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:group, [:template_id])
  end
end
