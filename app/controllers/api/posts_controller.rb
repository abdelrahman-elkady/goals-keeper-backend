class Api::PostsController < Api::BaseController
  def show
    @post = Post.find(params[:id])
  end
  
  def get_comments
    @comments = Goal.find(params[:id]).comments.all
  end

  def get_likes
    @likes = Goal.find(params[:id]).likes.all
  end

  def comment
    @comments = Goal.find(params[:id]).comments.all
  end

  def like
    @likes = Goal.find(params[:id]).likes.all
  end
protected

  def goal_params
    params.require(:goal).permit(:title, :description)
  end
  def post_params
    params.require(:post).permit(:text)
  end
end
