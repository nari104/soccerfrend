Rails.application.routes.draw do

  root to: 'posts#index'
  devise_for :users, only: [:sessions, :registrations], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :posts, only: [:new, :create, :index, :show, :update, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end

  get "search" => "searches#search"

  resources :posts, only: [:new, :create, :index, :show, :update, :edit, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end
