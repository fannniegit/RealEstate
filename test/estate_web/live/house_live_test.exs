defmodule EstateWeb.HouseLiveTest do
  use EstateWeb.ConnCase

  import Phoenix.LiveViewTest
  import Estate.HousesFixtures

  @create_attrs %{bathrooms: 42, location: "some location", rooms: 42, type: "some type", yo: "some yo"}
  @update_attrs %{bathrooms: 43, location: "some updated location", rooms: 43, type: "some updated type", yo: "some updated yo"}
  @invalid_attrs %{bathrooms: nil, location: nil, rooms: nil, type: nil, yo: nil}

  defp create_house(_) do
    house = house_fixture()
    %{house: house}
  end

  describe "Index" do
    setup [:create_house]

    test "lists all houses", %{conn: conn, house: house} do
      {:ok, _index_live, html} = live(conn, ~p"/houses")

      assert html =~ "Listing Houses"
      assert html =~ house.location
    end

    test "saves new house", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/houses")

      assert index_live |> element("a", "New House") |> render_click() =~
               "New House"

      assert_patch(index_live, ~p"/houses/new")

      assert index_live
             |> form("#house-form", house: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#house-form", house: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/houses")

      html = render(index_live)
      assert html =~ "House created successfully"
      assert html =~ "some location"
    end

    test "updates house in listing", %{conn: conn, house: house} do
      {:ok, index_live, _html} = live(conn, ~p"/houses")

      assert index_live |> element("#houses-#{house.id} a", "Edit") |> render_click() =~
               "Edit House"

      assert_patch(index_live, ~p"/houses/#{house}/edit")

      assert index_live
             |> form("#house-form", house: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#house-form", house: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/houses")

      html = render(index_live)
      assert html =~ "House updated successfully"
      assert html =~ "some updated location"
    end

    test "deletes house in listing", %{conn: conn, house: house} do
      {:ok, index_live, _html} = live(conn, ~p"/houses")

      assert index_live |> element("#houses-#{house.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#houses-#{house.id}")
    end
  end

  describe "Show" do
    setup [:create_house]

    test "displays house", %{conn: conn, house: house} do
      {:ok, _show_live, html} = live(conn, ~p"/houses/#{house}")

      assert html =~ "Show House"
      assert html =~ house.location
    end

    test "updates house within modal", %{conn: conn, house: house} do
      {:ok, show_live, _html} = live(conn, ~p"/houses/#{house}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit House"

      assert_patch(show_live, ~p"/houses/#{house}/show/edit")

      assert show_live
             |> form("#house-form", house: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#house-form", house: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/houses/#{house}")

      html = render(show_live)
      assert html =~ "House updated successfully"
      assert html =~ "some updated location"
    end
  end
end
