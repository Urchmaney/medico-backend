Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index, :create]
      resources :roles, only: [:index, :show]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
