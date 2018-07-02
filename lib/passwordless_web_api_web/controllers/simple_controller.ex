defmodule PasswordlessWebApiWeb.SimpleController do
  use PasswordlessWebApiWeb, :controller
  alias PasswordlessWebApi.Repo
  alias PasswordlessWebApi.Veil

  def show(conn, %{"session_id" => unique_session_id}) do
    IO.inspect conn.assigns[:veil_user_id]
    render(conn, "ok.json")
  end
end