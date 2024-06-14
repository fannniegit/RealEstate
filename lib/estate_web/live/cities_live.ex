defmodule EstateWeb.CitiesLive do
  use EstateWeb, :live_view

  alias Estate.Cities

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        city: "",
        city_info: %{},
        loading: false,
        matches: %{}
      )

    {:ok, socket}
  end
  def render(assigns) do
    ~H"""
    <style>
    body::before {
      content: "";
      background: url('https://img.freepik.com/premium-photo/3d-visualization-house-white-background-modern-architecture-3d-model-house_727625-182.jpg?w=1060');
      background-size: cover;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      opacity: 0.3;
      z-index: -1;
    }
    </style>

    <div class="container mx-auto mt-8">


      <h1 class="text-3xl font-semibold mb-4"><%= gettext "Find a City in California" %></h1>
      <form phx-submit="search" phx-change="suggest" class="flex items-center">
        <input
          type="text"
          name="city"
          value={@city}
          placeholder={gettext("Enter City Name")}
          class="w-full p-2 rounded-l border"
          autofocus
          autocomplete="off"
          readonly={@loading}
          list="city-matches"
        />
        <button type="submit" class="bg-blue-500 text-white p-2 pl-4 pr-6 rounded-r flex items-center">
          <img src="/images/tur.svg" alt="Search" class="h-7 w-6 mr-2" />
          Search
        </button>
  </form>

  <%!-- <div :if={@loading} class="mt-4 text-blue-500"><%= gettext "Loading..." %></div> --%>

  <div :if={@loading} class="mt-4 text-blue-500"><%= gettext "Loading..."%></div>

      <div class="mt-4">
        <table class="table-auto border border-gray-300 w-full">
          <thead>

          <%!-- <tr class="bg-gray-200">
          <th class="p-4"><%= gettext "City" %></th>
          <th class="p-4"><%= gettext "Population" %></th>
          <th class="p-4"><%= gettext "Has Airport" %></th>
          <th class="p-4"><%= gettext "Has Cultural Events" %></th>
          </tr>
          </thead> --%>



            <tr class="bg-gray-200">
            <th class="p-4"><%= gettext "City" %></th>
          <th class="p-4"><%= gettext "Population" %></th>
          <th class="p-4"><%= gettext "Has Airport" %></th>
          <th class="p-4"><%= gettext "Has Cultural Events" %></th>
            </tr>
          </thead>
          <tbody>
            <tr :for={city <- @city_info} class="bg-white">
              <td class="p-6"><%= city.name %></td>
              <td class="p-6"><%= city.population %></td>
              <td class="p-6"><%= if city.has_airport, do: "Yes", else: "No" %></td>
              <td class="p-6"><%= if city.has_cultural_events, do: "Yes", else: "No" %></td>
            </tr>
          </tbody>
        </table>
      </div>

      <datalist id="city-matches">
        <%= for name <- @matches do %>
          <option value={name}></option>
        <% end %>
      </datalist>
    </div>
    """
  end


  def handle_event("suggest", %{"city" => prefix}, socket) do
    matches = Cities.suggest(prefix)
    {:noreply, assign(socket, matches: matches)}
  end

  def handle_event("search", %{"city" => city_name}, socket) do
    send(self(), {:run_search, city_name})

    socket =
      assign(socket,
        city: city_name,
        city_info: [],
        loading: true
      )

    {:noreply, socket}
  end

  def handle_info({:run_search, city_name}, socket) do
    socket =
      assign(socket,
        city_info: Cities.search_by_city(city_name),
        loading: false
      )

    {:noreply, socket}
  end
end
