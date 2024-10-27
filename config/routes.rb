Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users, only: [:sessions, :registrations], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :posts, only: [:new, :create, :index, :show, :update, :edit, :destroy]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
