defmodule Slack.Router do
  use Slack.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Slack do
    pipe_through :api
  end
end
