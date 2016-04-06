Rails.application.routes.draw do

  resource :profile
  resources :groups
  resources :books
  resources :comments
  resources :invites
  resources :favorites, only: [:create, :destroy]
  get "/joins" => "joins#join"

  devise_for :users, :controllers => { registrations: 'users/registrations', 
                                        omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    match '/twitter_signup' => 
          'users/omniauth_callbacks#twitter_submit', via: [:post, :patch]
  end

  root to: "groups#index"
  
end
