Rails.application.routes.draw do
  devise_for :users
  root to: "homes#about"
  resources :users, only: [:show, :edit, :update] do
    get "follows" => "users#follows"
    get "followers" => "users#followers"
    get "welcome" => "users#welcome"
    get "calender" => "users#calender"
    resource :relationships, only: [:create, :destroy]
  end
  get "mypage/cancel" => "users#cancel"
  patch "mypage" => "users#cancel"

  resources :books, only: [:index, :show, :create] do
    resources :book_reads,  only: [:show, :create, :destroy, :update] do
      resources :read_comments,  only: [:create, :destroy]
      resource :read_favorites,  only: [:create, :destroy]
    end
    resource :book_unreads,  only: [:create, :destroy]
  end


  get "book/ranking" => "books#ranking"

end
