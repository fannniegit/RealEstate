defmodule Estate.Repo.Migrations.CreateHouses do
  use Ecto.Migration

  def change do
    create table(:houses) do
      add :type, :string
      add :rooms, :integer
      add :bathrooms, :integer
      add :yo, :string
      add :location, :string

      timestamps()
    end
  end
end
