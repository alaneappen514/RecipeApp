Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  root 'recipes#index'
  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end