Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }
  root to: "homes#about"
  resources :users, only: [:show, :edit, :update] do
    get "follows" => "users#follows"
    get "followers" => "users#followers"
    get "welcome" => "users#welcome"
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
  resources :timelines, only: [:index]
  resources :notifications, only: [:index]
  get "book/ranking" => "books#ranking"

end
