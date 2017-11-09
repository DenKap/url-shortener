Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :links

  root 'links#new'

  get '/:short_url', to: 'links#redirect', as: :l
end
