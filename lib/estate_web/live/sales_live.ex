defmodule EstateWeb.SalesLive do
  use EstateWeb, :live_view

  alias Estate.Sales

  def mount(_params, _session, socket) do
    {:ok, assign_stats(socket)}
  end

  def render(assigns) do
  ~H"""

  <div class="max-w-3xl mx-auto p-6">
    <h1 class="text-4xl font-bold mb-4">Sales statistics 📊</h1>
    <div id="sales" class="bg-white shadow-md p-6 rounded-lg">
      <div class="stats grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="stat bg-blue-100 rounded-lg p-6">
          <span class="block text-4xl font-bold text-blue-600"><%= @new_orders %></span>
          <span class="text-gray-600 text-lg">Houses for sale</span>
        </div>
        <div class="stat bg-green-100 rounded-lg p-6">
          <span class="block text-4xl font-bold text-green-600"><%= @sales_amount %></span>
          <span class="text-gray-600 text-lg">Interested people</span>
        </div>
        <div class="stat bg-yellow-100 rounded-lg p-6">
          <span class="block text-4xl font-bold text-yellow-600"><%= @satisfaction %>%</span>
          <span class="text-gray-600 text-lg">Satisfaction rate</span>
        </div>
      </div>
      <button phx-click="refresh" class="mt-6 bg-white-500 hover:bg-blue-200 text-blue font-bold py-4 px-8 rounded-full flex items-center">
        <img src="/images/ref.svg" class="h-6 w-6 mr-3" /> Refresh
</button>

    </div>
  </div>
  """
end

  def handle_event("refresh", _, socket) do
    {:noreply, assign_stats(socket)}
  end

  defp assign_stats(socket) do
    assign(socket,
      new_orders: Sales.new_orders(),
      sales_amount: Sales.sales_amount(),
      satisfaction: Sales.satisfaction()
    )
  end
end
