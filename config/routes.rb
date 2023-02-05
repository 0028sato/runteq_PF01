Rails.application.routes.draw do
  namespace :admin do
    get 'user_sessions/new'
  end
  namespace :admin do
    get 'dashboards/index'
  end
  get 'items/search'
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'posts#index'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resources :users, only: %i[new create]
  resources :posts do
    collection do
      get :likes
      get :my_posts
    end
  end
  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  resources :tags do
    get 'posts', to: 'posts#search'
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get 'items/search'

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :posts
    resources :users
  end
end
