Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    post '/authentication/', to: 'sessions#create', as: 'authentication'
    resources :users
    get 'users/:id/goals' => 'users#user_goals'
    get 'users/:id/posts' => 'users#user_posts'
    post 'users/:id/goals' => 'users#user_add_goals'
    get 'users/:id/followings' => 'users#user_followings'
    get 'users/:id/followers' => 'users#user_followers'
    resources :goals
    get 'goals/:id/posts' => 'goals#goal_posts'
    post 'goals/:id/posts' => 'goals#post_create'
    resources :posts
    get 'posts/:id/comments' => 'posts#get_comments'
    get 'posts/:id/likes' => 'posts#get_likes'
    post 'posts/:id/comments' => 'posts#comment'
    post 'posts/:id/likes' => 'posts#like'
  end
end
