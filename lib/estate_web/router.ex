defmodule EstateWeb.Router do
  use EstateWeb, :router

  import EstateWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {EstateWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug EstateWeb.Plugs.Locale, "en"
    plug SetLocale, gettext: EstateWeb.Gettext, default_locale: "en"
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/:locale", EstateWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/rent", RentController, :index
    get "/buy", BuyController, :index
    get "/contacts", ContactsController, :index
    get "/questions", QuestionsController, :index
    resources "/products", ProductController
    resources "/rent/products", ProductController
    resources "/buy/products", ProductController
    get "/book", BookController, :index
    get "/notf", NotfController, :index
    resources "/properties", PropertyController
  end
  # scope "/api", EstateWeb do
  #   pipe_through :api
  # end

  scope "/", EstateWeb do
    pipe_through :browser

    get "/", PageController, :home
  end
  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:estate, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EstateWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/:locale", EstateWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{EstateWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/:locale", EstateWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{EstateWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
      live "/houses", HouseLive.Index, :index
      live "/houses/new", HouseLive.Index, :new
      live "/houses/:id/edit", HouseLive.Index, :edit

    live "/houses/:id", HouseLive.Show, :show
    live "/houses/:id/show/edit", HouseLive.Show, :edit


    live "/booking", BookingLive
    live "/donations", DonationsLive
    live "/sales", SalesLive
    live"/cities", CitiesLive
    live"/dynam", DynamLive
    live"/listings", ListingsLive
    live"/uploads", UploadsLive
    live "/pphotos", PphotosLive

  end
  end

  scope "/", EstateWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{EstateWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
