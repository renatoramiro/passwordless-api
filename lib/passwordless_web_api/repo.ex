defmodule PasswordlessWebApi.Repo do
  use Ecto.Repo, otp_app: :passwordless_web_api

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
