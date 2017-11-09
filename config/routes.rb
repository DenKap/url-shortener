Rails.application.routes.draw do
  resources :links

  root 'links#new'

  get '/:short_url', to: 'links#redirect', as: :s 
end
