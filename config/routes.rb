Rails.application.routes.draw do
  devise_for :users
  root to: "homes#about"
  resources :users, only: [:show, :edit, :update] do
    get "follows" => "users#follows"
    get "followers" => "users#followers"
    get "welcome" => "users#welcome"
    resource :relationships, only: [:create, :destroy]
  end
  get "mypage/cancel" => "users#cancel"
  patch "mypage" => "users#cancel"

  resources :books, only: [:index, :show, :create] do
    resources :book_comments,  only: [:create, :destroy]
    resource :book_reads,  only: [:show, :create, :destroy, :update]
    resource :book_unreads,  only: [:create, :destroy]
  end

  get "book/ranking" => "books#ranking"

end
