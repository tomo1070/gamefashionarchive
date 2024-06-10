Rails.application.routes.draw do
  get "/home/about" => "homes#about", as: "about"
  root to: "homes#top"
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  resources :lists, only: [:index, :show]
  resources :posts, only: [:new, :create, :show,]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
