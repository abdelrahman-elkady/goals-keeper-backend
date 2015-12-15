Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    post '/authentication/', to: 'sessions#create', as: 'authentication'
    resources :users
    get 'users/:id/goals' => 'users#user_goals'
    get 'users/:id/posts' => 'users#user_posts'
  end
end
