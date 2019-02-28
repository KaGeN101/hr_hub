defmodule HrHubWeb.PageController do
  use HrHubWeb, :controller

  alias PayrollServices.Employees

  def index(conn, _params) do
    employees = Employees.fetch
    render(conn, "index.html", employees: employees)
  end
end
