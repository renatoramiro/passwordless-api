defmodule PasswordlessWebApiWeb.Veil.SessionView do
  use PasswordlessWebApiWeb, :view

  
  def render("ok.json", _assigns) do
    %{ok: true}
  end

  def render("show.json", %{session: session}) do
    %{session_id: session.unique_id}
  end
  
end
