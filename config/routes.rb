Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post '/authentication/', to: 'sessions#create', as: 'authentication'
  end
end
