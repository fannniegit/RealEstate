defmodule Estate.Homes.Listing do

  import Ecto.Query
  alias Estate.Repo
  alias Estate.Homes.Listing.Listing

  def list_listings do
    Repo.all(from l in Listing, order_by: [asc: l.id])
  end

  def list_listings(options) when is_map(options) do
    from(Listing)
    |> sort(options)
    |> Repo.all()
  end

  defp sort(query, %{sort_by: sort_by, sort_order: sort_order}) do
    order_by(query, {^sort_order, ^sort_by})
  end

  defp sort(query, _options), do: query

end
