defmodule Estate.HousesTest do
  use Estate.DataCase

  alias Estate.Houses

  describe "houses" do
    alias Estate.Houses.House

    import Estate.HousesFixtures

    @invalid_attrs %{bathrooms: nil, location: nil, rooms: nil, type: nil, yo: nil}

    test "list_houses/0 returns all houses" do
      house = house_fixture()
      assert Houses.list_houses() == [house]
    end

    test "get_house!/1 returns the house with given id" do
      house = house_fixture()
      assert Houses.get_house!(house.id) == house
    end

    test "create_house/1 with valid data creates a house" do
      valid_attrs = %{bathrooms: 42, location: "some location", rooms: 42, type: "some type", yo: "some yo"}

      assert {:ok, %House{} = house} = Houses.create_house(valid_attrs)
      assert house.bathrooms == 42
      assert house.location == "some location"
      assert house.rooms == 42
      assert house.type == "some type"
      assert house.yo == "some yo"
    end

    test "create_house/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Houses.create_house(@invalid_attrs)
    end

    test "update_house/2 with valid data updates the house" do
      house = house_fixture()
      update_attrs = %{bathrooms: 43, location: "some updated location", rooms: 43, type: "some updated type", yo: "some updated yo"}

      assert {:ok, %House{} = house} = Houses.update_house(house, update_attrs)
      assert house.bathrooms == 43
      assert house.location == "some updated location"
      assert house.rooms == 43
      assert house.type == "some updated type"
      assert house.yo == "some updated yo"
    end

    test "update_house/2 with invalid data returns error changeset" do
      house = house_fixture()
      assert {:error, %Ecto.Changeset{}} = Houses.update_house(house, @invalid_attrs)
      assert house == Houses.get_house!(house.id)
    end

    test "delete_house/1 deletes the house" do
      house = house_fixture()
      assert {:ok, %House{}} = Houses.delete_house(house)
      assert_raise Ecto.NoResultsError, fn -> Houses.get_house!(house.id) end
    end

    test "change_house/1 returns a house changeset" do
      house = house_fixture()
      assert %Ecto.Changeset{} = Houses.change_house(house)
    end
  end
end
