defmodule PasswordlessWebApiWeb.Veil.LoginEmail do
  use Phoenix.Swoosh, view: PasswordlessWebApiWeb.Veil.EmailView

  @doc """
  Generates an email using the login template.
  """
  def generate(email, url) do
    site = Application.get_env(:veil, :site_name)
    map = url |> URI.decode() |> URI.decode_query()
    key = map |> Map.keys() |> List.first()
    request_id = Map.get(map, key)

    IO.inspect url
    IO.inspect request_id

    new()
    |> to(email)
    |> from(from_email())
    |> subject("Welcome to #{site}!")
    |> render_body("login.html", %{url: url, site_name: site, request_id: request_id})
  end

  defp from_email do
    {Application.get_env(:veil, :email_from_name),
     Application.get_env(:veil, :email_from_address)}
  end
end
