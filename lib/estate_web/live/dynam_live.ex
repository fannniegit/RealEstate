defmodule EstateWeb.DynamLive do
  use EstateWeb, :live_view
  alias Estate.Dynam

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        area: nil,
        bedrooms: nil,
        bathrooms: nil,
        square_footage: nil,
        cost: nil
      )

    {:ok, socket}
  end


  def render(assigns) do
    ~H"""
    <div class="estate-container">
      <h1 class="text-2xl font-bold">Calculate Real Estate Cost</h1>
      <div class="estate-form my-6 p-4 bg-white rounded-lg shadow-md">
        <form phx-change="calculate" phx-submit="get-cost">
          <div class="flex flex-wrap -mx-3 mb-6">
            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
              <label for="area" class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">Area (sqft)</label>
              <div class="relative">
                <input type="number" name="area" value={@area} min="0" required class="block appearance-none w-full bg-white border border-gray-400 rounded py-2 px-3 leading-tight focus:outline-none focus:border-indigo-500 focus:bg-white text-gray-700" phx-debounce="500"/>
              </div>
            </div>
            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
              <label for="bedrooms" class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">Bedrooms</label>
              <div class="relative">
                <input type="number" name="bedrooms" value={@bedrooms} min="0" required class="block appearance-none w-full bg-white border border-gray-400 rounded py-2 px-3 leading-tight focus:outline-none focus:border-indigo-500 focus:bg-white text-gray-700" phx-debounce="500"/>
              </div>
            </div>
          </div>
          <div class="flex flex-wrap -mx-3 mb-6">
            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
              <label for="bathrooms" class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">Bathrooms</label>
              <div class="relative">
                <input type="number" name="bathrooms" value={@bathrooms} min="0" required class="block appearance-none w-full bg-white border border-gray-400 rounded py-2 px-3 leading-tight focus:outline-none focus:border-indigo-500 focus.bg-white text-gray-700" phx-debounce="500"/>
              </div>
            </div>
            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
              <label for="square_footage" class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">Square Footage</label>
              <div class="relative">
                <input type="number" name="square_footage" value={@square_footage} min="0" required class="block appearance-none w-full bg-white border border-gray-400 rounded py-2 px-3 leading-tight focus:outline-none focus:border-indigo-500 focus.bg-white text-gray-700" phx-debounce="500"/>
              </div>
            </div>
          </div>
          <div class="mb-6">
            The estimated cost is <span class="font-bold text-lg"><%=  @cost %></span>
          </div>

        </form>
      </div>
    </div>
    """
  end
  def handle_event("get-cost", _, socket) do
    area = String.to_integer(socket.assigns.area, 0)
    bedrooms = String.to_integer(socket.assigns.bedrooms, 0)
    bathrooms = String.to_integer(socket.assigns.bathrooms, 0)
    square_footage = String.to_integer(socket.assigns.square_footage, 0)

    if is_integer(area) and is_integer(bedrooms) and is_integer(bathrooms) and is_integer(square_footage) do
      cost = Dynam.calculate_cost(area, bedrooms, bathrooms, square_footage)
      {:noreply, assign(socket, cost: cost)}
    else
      {:noreply, socket}
    end
  end

  def handle_event("calculate", params, socket) do
    %{
      "area" => area,
      "bedrooms" => bedrooms,
      "bathrooms" => bathrooms,
      "square_footage" => square_footage
    } = params

    area = parse_integer(area)
    bedrooms = parse_integer(bedrooms)
    bathrooms = parse_integer(bathrooms)
    square_footage = parse_integer(square_footage)

    if is_integer(area) and is_integer(bedrooms) and is_integer(bathrooms) and is_integer(square_footage) do
      cost = Estate.Dynam.calculate_cost(area, bedrooms, bathrooms, square_footage)

      {:noreply, assign(socket, cost: cost)}
    else
      {:noreply, socket}
    end
  end

  defp parse_integer("", default \\ nil), do: default
  defp parse_integer(value, _default), do: String.to_integer(value)
end
