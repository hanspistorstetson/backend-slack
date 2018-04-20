defmodule Slack.Router do
  use Slack.Web, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
    plug(Guardian.Plug.LoadResource)
  end

  scope "/api", Slack do
    pipe_through(:api)

    post("/sessions", SessionController, :create)
    delete("/sessions", SessionController, :delete)
    post("/sessions/refresh", SessionController, :refresh)
    resources("/users", UserController, only: [:create])
  end
end
