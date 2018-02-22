defmodule TaskerWeb.PageController do
  use TaskerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
