Rails.application.routes.draw do
  devise_for :users
  get 'categories/new'

  get 'categories/create'

  root 'posts#index'
  resources :posts
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
