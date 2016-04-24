Rails.application.routes.draw do

  get 'pages/about'
  get 'pages/contact'
  match '/send_mail', to: 'contact#send_mail', via: 'post'

  get 'group_registrations/destroy'

  resource :profile
  resources :groups
  resources :books
  resources :comments
  resources :invites
  resources :favorites, only: [:create, :destroy]
  resources :group_registrations, only: [:destroy]
  get "/joins" => "joins#join"

  devise_for :users, :controllers => { registrations: 'users/registrations', 
                                        omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    match '/twitter_signup' => 
          'users/omniauth_callbacks#twitter_submit', via: [:post, :patch]
  end

  root to: "pages#home"

  get '/.well-known/acme-challenge/iuk2EFE2Qv9-Ot7MasPLo4Y0sKEdeGkx9UJ9_gica-M.5EioOBuTgSj5ZhG2CkqbPYMf1x8u9DOP3X28H8glwis' => 'pages#letsencrypt'
  
end
