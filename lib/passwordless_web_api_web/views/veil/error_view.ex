defmodule PasswordlessWebApiWeb.Veil.ErrorView do
  use PasswordlessWebApiWeb, :view
  
  def render("no_permission.json", _assigns) do
    %{errors: %{detail: "No permission"}}
  end

  def render("invalid_mail_api_key.json", _assigns) do
    %{errors: %{detail: "Invalid Mail API key in config"}}
  end
  
end
