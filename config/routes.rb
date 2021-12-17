Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  get '/login', to:'user_sessions#new'
  post '/login', to:'user_sessions#create'
  delete '/logout', to:'user_sessions#destroy'

  resources :users, only: %i[index show new create update]
  resources :chat_rooms, only: %i[create show]
end
