Rails.application.routes.draw do
  root 'posts#index'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :posts, only: %i[new create show edit index] do
    collection do
      get :likes
      get :my_posts
    end
  end
  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :snow_boards

  resources :tags do
    get 'posts', to: 'posts#search'
  end
end
