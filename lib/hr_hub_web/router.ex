defmodule HrHubWeb.Router do
  use HrHubWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HrHubWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/employees", EmployeeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HrHubWeb do
  #   pipe_through :api
  # end
end
