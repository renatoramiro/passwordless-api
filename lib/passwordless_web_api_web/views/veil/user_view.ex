defmodule PasswordlessWebApiWeb.Veil.UserView do
  use PasswordlessWebApiWeb, :view

  def render("ok.json", _assigns) do
    %{ok: true}
  end
  
end
