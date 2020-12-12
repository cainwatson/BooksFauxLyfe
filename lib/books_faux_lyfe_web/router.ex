defmodule BooksFauxLyfeWeb.Router do
  use BooksFauxLyfeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BooksFauxLyfeWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BooksFauxLyfeWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/books", BookLive.Index, :index
    live "/books/new", BookLive.Index, :new
    live "/books/:id/edit", BookLive.Index, :edit

    live "/books/:id", BookLive.Show, :show
    live "/books/:id/show/edit", BookLive.Show, :edit

    live "/authors", AuthorLive.Index, :index
    live "/authors/new", AuthorLive.Index, :new
    live "/authors/:id/edit", AuthorLive.Index, :edit

    live "/authors/:id", AuthorLive.Show, :show
    live "/authors/:id/show/edit", AuthorLive.Show, :edit

    live "/works", WorkLive.Index, :index
    live "/works/new", WorkLive.Index, :new
    live "/works/:id/edit", WorkLive.Index, :edit

    live "/works/:id", WorkLive.Show, :show
    live "/works/:id/show/edit", WorkLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", BooksFauxLyfeWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: BooksFauxLyfeWeb.Telemetry
    end
  end
end
