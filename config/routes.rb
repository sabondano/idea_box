Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :rewards, only: [:index]

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
    resources :rewards, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :users do
    resources :rewards, only: [:create]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "rewards#index"
end
