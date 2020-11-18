Rails.application.routes.draw do
  devise_for :users
  get 'works/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create] do
    resources :works, only: [:index, :new, :create]
  end
end
