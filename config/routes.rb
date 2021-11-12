Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create show edit update]
  resources :categories
  
  resources :puzzles do
    resources :solutions, exept: %i[new show destroy]
  end

  root 'pages#index'

  match 'auth/:google_oauth2/callback' => 'sessions#omni_sign_in', via: [:get, :post]
  match 'auth/:github/callback' => 'sessions#omni_sign_in', via: [:get, :post]
  match '/auth/:facebook/callback' => 'sessions#omni_sign_in', via: [:get, :post]

end
