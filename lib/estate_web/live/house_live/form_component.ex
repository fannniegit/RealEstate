defmodule EstateWeb.HouseLive.FormComponent do
  use EstateWeb, :live_component

  alias Estate.Houses

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <style>
        .simple_form {
          max-width: 400px; /
          margin: 0 auto;
        }

        .simple_form .input {
          margin-bottom: 10px;
        }

        .simple_form .actions {
          margin-top: 10px;
        }

        .row {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
        }

        .row .input {
          width: calc(50% - 5px);
        }
      </style>      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage house records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="house-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:type]} type="text" label="Type" />
        <div class="row">
        <.input field={@form[:rooms]} type="number" label="Rooms" />
        <.input field={@form[:bathrooms]} type="number" label="Bathrooms" />
        </div>
        <div class="row">
        <.input field={@form[:yo]} type="text" label="Yo" />
        <.input field={@form[:location]} type="text" label="Location" />
        </div>
        <:actions>
          <.button phx-disable-with="Saving...">Save House</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{house: house} = assigns, socket) do
    changeset = Houses.change_house(house)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"house" => house_params}, socket) do
    changeset =
      socket.assigns.house
      |> Houses.change_house(house_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"house" => house_params}, socket) do
    save_house(socket, socket.assigns.action, house_params)
  end

  defp save_house(socket, :edit, house_params) do
    case Houses.update_house(socket.assigns.house, house_params) do
      {:ok, house} ->
        notify_parent({:saved, house})

        {:noreply,
         socket
         |> put_flash(:info, "House updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_house(socket, :new, house_params) do
    case Houses.create_house(house_params) do
      {:ok, house} ->
        notify_parent({:saved, house})

        {:noreply,
         socket
         |> put_flash(:info, "House created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
