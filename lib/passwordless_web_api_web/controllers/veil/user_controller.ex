defmodule PasswordlessWebApiWeb.Veil.UserController do
  use PasswordlessWebApiWeb, :controller
  alias PasswordlessWebApi.Veil
  alias PasswordlessWebApi.Veil.User

  action_fallback(PasswordlessWebApiWeb.Veil.FallbackController)

  

  @doc """
  If needed, creates a new user, otherwise finds the existing one.
  Creates a new request and emails the unique id to the user.
  """
  
  def create(conn, %{"email" => email}) when not is_nil(email) do
  
    if user = Veil.get_user_by_email(email) do
      sign_and_email(conn, user)
    else
      with {:ok, user} <- Veil.create_user(email) do
        sign_and_email(conn, user)
      else
        error ->
          error
      end
    end
  end

  defp sign_and_email(conn, %User{} = user) do
    with {:ok, request} <- Veil.create_request(conn, user),
         {:ok, email} <- Veil.send_login_email(conn, user, request) do
      
        render(conn, "ok.json")
      
    else
      error ->
        error
    end
  end
end
