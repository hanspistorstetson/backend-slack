defmodule Slack.UserController do
  use Slack.Web, :controller

  alias Slack.User

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        jwt = Guardian.Plug.current_token(new_conn)

        conn
        |> put_status(:created)
        |> render(Slack.SessioNView, "show.json", user: user, jwt: jwt)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Slack.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
