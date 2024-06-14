defmodule Estate.Repo.Migrations.HomesListings do
  use Ecto.Migration

  def change do
    create table(:listings) do
      add :property_type, :string
      add :price, :decimal
      add :bedrooms, :integer
      add :bathrooms, :integer
      add :square_feet, :integer
      add :address, :string
      add :description, :string
      timestamps()
  end
end
end
