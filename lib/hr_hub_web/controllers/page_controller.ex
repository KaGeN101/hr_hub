defmodule HrHubWeb.PageController do
  use HrHubWeb, :controller

  alias PayrollServices.Access

  def index(conn, _params) do
    employees = Access.fetch
    render(conn, "index.html", employees: employees)
  end
end
