defmodule PasswordlessWebApiWeb.Veil.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  require Logger
  use PasswordlessWebApiWeb, :controller
  alias PasswordlessWebApi.Veil.User

  def call(conn, {:error, {:closed, ""}}) do
    Logger.error(fn -> "[Veil] Invalid Swoosh api key, update your config.exs" end)
    
    render(conn, PasswordlessWebApiWeb.Veil.ErrorView, :invalid_mail_api_key)
    
  end

  def call(conn, {:error, :no_permission}) do
    Logger.error(fn -> "[Veil] Invalid Request or Session" end)
    
    render(conn, PasswordlessWebApiWeb.Veil.ErrorView, :no_permission)
    
  end
end
