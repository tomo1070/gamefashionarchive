Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :comments, only: [:destroy]
  end

  get "/home/about" => "homes#about", as: "about"
  root to: "homes#top"

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  scope module: :public do
    devise_for :users, controllers: {
      sessions: 'public/sessions'
    }
    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    resources :lists, only: [:index, :show]
    resources :posts, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :groups, only: [:new, :index, :show, :create, :edit, :update]
  end
end
