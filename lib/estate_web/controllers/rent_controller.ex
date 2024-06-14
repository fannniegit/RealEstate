defmodule EstateWeb.RentController do
  use EstateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
