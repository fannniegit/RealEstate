defmodule EstateWeb.BookingLive do
  use EstateWeb, :live_view




  def mount(_params, _session, socket) do
    socket =
      assign(socket, date: "2023-01-01", second_date: "2023-02-02")

  {:ok, socket}
  end


  def render(assigns) do
    ~H"""
    <style>
      body {
        background: url('https://back2balance.co.uk/wp-content/uploads/2022/08/Untitled-design-76-940x675.png') no-repeat center center fixed;
        background-size: cover;
        position: relative;
      }

      body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 15.5%;
        background-color: #ffffb7;
        z-index: -1;
      }

      .booking-form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        border-radius: 8px;
      }

      .booking-form h2 {
        text-align: center;
        color: #ff4000;
      }

      .booking-form form {
        display: flex;
        flex-direction: column;
      }

      .booking-form label {
        margin-top: 10px;
        color: #333;
      }

      .booking-form input {
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }

      .booking-form button {
        background-color: #ff5733;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        margin-top: 20px;
        cursor: pointer;
      }

      .booking-form button:hover {
        background-color: #ff4000;
      }
    </style>
    <div class="booking-form">
      <h2>Book your place now!</h2>
      <form phx-submit="submit-booking">
        <label for="date">Select a date:</label>
        <input phx-change="date-change" name="date" type="date" value={@date} min="2023-01-01" max="2025-12-31" />

        <label for="second-date">Select a second date:</label>
        <input phx-change="second-date-change" name="second-date" type="date" value={@date} min={@date} max="2025-12-31" />

        <button type="submit">Book Now</button>
      </form>
    </div>
    """
  end


  def handle_event("date-change", %{"date" => date}, socket) do
    IO.inspect(date)
   # IO.inspect(socket.assigns.date)

    {:noreply, assign(socket, date: date)}
  end

  def handle_event("second-date-change", params, socket) do
    IO.inspect(params)
   # IO.inspect(socket.assigns.date)

    {:noreply, socket}
  end

end
