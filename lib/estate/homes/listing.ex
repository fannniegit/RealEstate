defmodule Estate.Homes.Listing.Listing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "listings" do
    field :property_type, :string
    field :price, :decimal
    field :bedrooms, :integer
    field :bathrooms, :integer
    field :square_feet, :integer
    field :address, :string
    field :description, :string

    timestamps()
  end

  def changeset(listing, attrs) do
    listing
    |> cast(attrs, [:property_type, :price, :bedrooms, :bathrooms, :square_feet, :address, :description])
    |> validate_required([:property_type, :price, :bedrooms, :bathrooms, :square_feet, :address, :description])
  end
end
