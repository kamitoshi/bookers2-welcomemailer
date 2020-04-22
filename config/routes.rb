Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :users,only: [:show,:index,:edit,:update]
  get 'users/:id/follows' => "users#follows", as: "follows"
  get 'users/:id/followers' => "users#followers", as: "followers"
  resources :books do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  post 'follow/:id' => "relationships#create", as: "follow"
  delete 'unfollow/:id' => "relationships#destroy", as: "unfollow"
  get 'search' => "search#action", as: "search"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end