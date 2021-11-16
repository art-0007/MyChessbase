# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  concern :commentable do
    resources :comments, only: %i[create destroy]
  end

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create show edit update]
  resources :categories
  resources :articles

  resources :puzzles, concerns: :commentable do
    resources :solutions, exept: %i[new show destroy]
  end

  resources :articles, exept: %i[new show], concerns: :commentable

  root 'pages#index'

  match 'auth/:google_oauth2/callback' => 'sessions#omni_sign_in', via: %i[get post]
  match 'auth/:github/callback' => 'sessions#omni_sign_in', via: %i[get post]
  match '/auth/:facebook/callback' => 'sessions#omni_sign_in', via: %i[get post]

  namespace :admin do
    resources :users, exept: %i[new show]
  end
end
