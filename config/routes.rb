Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    post '/authentication/', to: 'sessions#create', as: 'authentication'
    resources :users
    get 'users/:id/goals' => 'users#user_goals'
    get 'users/:id/posts' => 'users#user_posts'
    get 'users/:id/followings' => 'users#user_followings'
    get 'users/:id/followers' => 'users#user_followers'
    resources :goals
    get 'goals/:id/posts' => 'goals#goal_posts'
    post 'goals/:id/posts' => 'goals#post_create'
    resources :posts
    get 'posts/:id/comments' => 'goals#get_comments'
    get 'posts/:id/likes' => 'goals#get_likes'
    post 'posts/:id/comments' => 'goals#comment'
    post 'posts/:id/likes' => 'goals#like'
  end
end
