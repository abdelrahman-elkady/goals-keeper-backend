class Api::PostsController < Api::BaseController
  def show
    @post = Post.find(params[:id])
  end
  
  def get_comments
    @comments = Post.find(params[:id]).comments.all
  end

  def get_likes
    @likes = Post.find(params[:id]).likes.all
  end

  def comment
    @comment = Comment.new(comment_params)
    @data = JSON.parse(request.body.read)
    @comment.user = User.where(facebook_token: request.headers["facebook_token"]).first
    @comment.post = Post.find(params[:id])
    if @comment.save
      render nothing: true, :status => 200
    else
      render nothing: true, :status => 422
    end
  end

  def like
    @likes = Post.find(params[:id]).likes.all
  end
protected
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
