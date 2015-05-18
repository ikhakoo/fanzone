Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :tweets,        only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :entries,       only: [:index]
  resources :videos,        only: [:index, :new, :create]
  resources :video_uploads, only: [:new, :create]
  resources :comments,      only: [:new, :create]

  get    'signup'   => 'users#new'
  get    'signin'   => 'sessions#new'
  delete 'signout'  => 'sessions#destroy'
  get    'about'    => 'static_pages#about'
  get 'tags/:tag', to: 'tweets#index', as: "tag"

  match '*path' => 'application#routing_error', via: :all
  
end

