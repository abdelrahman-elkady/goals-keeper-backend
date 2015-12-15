class Api::GoalsController < Api::BaseController
  def index
  	@goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      render nothing: true, :status => 200
    else
      render nothing: true, :status => 422
    end
  end

  def post_create
    @post = Post.new(post_params)
    @post.user = User.where(facebook_token: request.headers["facebook_token"]).first
    @post.goal = Goal.find(params[:id])
    if @post.save
      render nothing: true, :status => 200
    else
      render nothing: true, :status => 422
    end
  end

  def goal_posts
    @posts = Goal.find(params[:id]).posts.all
  end
protected

  def goal_params
    params.permit(:title, :description)
  end
  def post_params
    params.permit(:text,:user_id,:goal_id)
  end
end
