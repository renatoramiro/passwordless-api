defmodule PasswordlessWebApiWeb.Router do
  use PasswordlessWebApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(PasswordlessWebApiWeb.Plugs.Veil.UserId)
  end

  scope "/api", PasswordlessWebApiWeb do
    pipe_through(:api)
  end

  # Default Routes for Veil
  scope "/veil", PasswordlessWebApiWeb.Veil do
    pipe_through(:api)

    post("/users", UserController, :create)

    post("/sessions/new", SessionController, :create)
    delete("/sessions/signout", SessionController, :delete)
  end

  # Add your routes that require authentication in this block.
  # Alternatively, you can use the default block and authenticate in the controllers.
  # See the Veil README for more.
  scope "/api", PasswordlessWebApiWeb do
    pipe_through([:api, PasswordlessWebApiWeb.Plugs.Veil.Authenticate])

    get("/test/test", SimpleController, :show)
  end
end
