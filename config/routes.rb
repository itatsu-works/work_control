Rails.application.routes.draw do
  devise_for :users
  get 'works/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :destroy] do
    resources :works, only: [:index, :new, :create, :edit, :destroy, :update,:show]
  end
end
