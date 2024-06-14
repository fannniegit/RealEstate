defmodule Estate.HousesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Estate.Houses` context.
  """

  @doc """
  Generate a house.
  """
  def house_fixture(attrs \\ %{}) do
    {:ok, house} =
      attrs
      |> Enum.into(%{
        bathrooms: 42,
        location: "some location",
        rooms: 42,
        type: "some type",
        yo: "some yo"
      })
      |> Estate.Houses.create_house()

    house
  end
end
