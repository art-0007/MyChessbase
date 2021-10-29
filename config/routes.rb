Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :pazzles


  root 'pages#index'

end
