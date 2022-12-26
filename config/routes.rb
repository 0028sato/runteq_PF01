Rails.application.routes.draw do
  root 'posts#index'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :posts, only: %i[new create show] do
    collection do
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
  resource :profile,only: %i[show edit update]
end
