Rails.application.routes.draw do
  get 'recipe_users/update'
  devise_for :users
  resources :recipes do
    resources :collaborations, only: [:create, :destroy]
  end
  
  root 'recipes#index'
  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
