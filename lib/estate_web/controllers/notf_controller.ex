defmodule EstateWeb.NotfController do
  use EstateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
