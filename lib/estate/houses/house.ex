defmodule Estate.Houses.House do
  use Ecto.Schema
  import Ecto.Changeset

  schema "houses" do
    field :bathrooms, :integer
    field :location, :string
    field :rooms, :integer
    field :type, :string
    field :yo, :string

    timestamps()
  end

  @doc false
  def changeset(house, attrs) do
    house
    |> cast(attrs, [:type, :rooms, :bathrooms, :yo, :location])
    |> validate_required([:type, :rooms, :bathrooms, :yo, :location])
    |> validate_length(:type, min: 2, max: 50, message: "Must be between 2 and 50 characters.")
    |> validate_length(:yo, min: 1, max: 20, message: "Price must be between 2 and 20 characters.")
    |> validate_length(:location, min: 2, max: 30, message: "Location must be between 2 and 30 characters.")
  end
end
