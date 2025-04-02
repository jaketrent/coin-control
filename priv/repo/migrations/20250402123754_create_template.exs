defmodule CoinControl.Repo.Migrations.CreateTemplate do
  use Ecto.Migration

  def change do
    create table(:template) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
