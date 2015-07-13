defmodule Cromer.PageController do
  use Cromer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
