Rails.application.routes.draw do
  get 'works/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "works#index"
end
