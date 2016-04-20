defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
  #  get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  #  get "/show-id/:id", PageController, :show
  #  resources "/reviews", ReviewController
  #  resources "/posts", PostController, only: [:index, :show]
  #  resources "/comments", CommentController, except: [:delete]
  #  get "/hello", HelloController, :index
  #  get "/hello/:messenger", HelloController, :show
  end
  
  scope "/admin", HelloPhoenix.Admin, as: :admin do
    pipe_through :browser
    
    resources "/reviews", ReviewController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end
end
