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
      render :status => 200
    else
      render :status => 422
    end
  end

  def post_create
    @post = Post.new(post_params)
    @data = JSON.parse(request.body.read)
    @post.user = User.where(facebook_token: "token").first
    @post.goal = Goal.find(params[:id])
    @post.save
    if @post.save
      render :status => 200
    else
      render :status => 422
    end
  end

  def goal_posts
    @posts = Goal.find(params[:id]).posts.all
  end
protected

  def goal_params
    params.require(:goal).permit(:title, :description)
  end
  def post_params
    params.require(:post).permit(:text)
  end
end
