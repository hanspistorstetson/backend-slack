defmodule SlackWeb.Router do
  use SlackWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SlackWeb do
    pipe_through :api
  end
end
