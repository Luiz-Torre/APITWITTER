Rails.application.routes.draw do
  resources :users, except: [:create]
  resources :posts
  resources :comments
  post '/login', to: 'authentication#login'
  post '/confirm', to: 'registration#confirm_email'
  post '/sign-up', to: 'registration#sign_up'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
