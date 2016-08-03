defmodule Zelnite.Repo.Migrations.CreateUnit do
  use Ecto.Migration

  def change do
    create table(:units) do
      add :name, :string
      add :stars, :integer
      add :cost, :integer
      add :thumbnail_url, :string

      timestamps
    end

  end
end
