Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "rewards#index"
end
