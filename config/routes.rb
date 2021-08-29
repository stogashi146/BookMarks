Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    :omniauth_callbacks => "users/omniauth_callbacks",
  }
  devise_scope :user do
    post "users/guest_sign_in" , to: "users/sessions#guest_sign_in"
  end

  root to: "homes#about"
  resources :users, only: [:show, :edit, :update] do
    get "calender" => "users#calender"
    get "cancel" => "users#cancel"
    patch "cancel" => "users#unsubscribe"
    resource :relationships, only: [:create, :destroy]
  end

  resources :books, only: [:index, :show, :create] do
    resources :book_reads,  only: [:show, :create, :destroy, :update] do
      resources :read_comments,  only: [:create, :destroy]
      resource :read_favorites,  only: [:create, :destroy]
    end
    resource :book_unreads,  only: [:create, :destroy]
  end
  get "book/ranking" => "books#ranking"
  resources :timelines, only: [:index]
  resources :notifications, only: [:index]


end
