defmodule Zelnite.PageController do
  use Zelnite.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
