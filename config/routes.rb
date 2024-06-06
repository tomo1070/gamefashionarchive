Rails.application.routes.draw do
  devise_for :users
  get "/home/about" => "homes#about", as: "about"
  root to: "homes#top"
  resources :lists, only: [:index, :show]
  resources :posts, only: [:new, :create]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
