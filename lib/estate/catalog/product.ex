defmodule Estate.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :price, :decimal
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :description, :price, :views])
    |> validate_required([:title, :description, :price, :views])
  end
end
