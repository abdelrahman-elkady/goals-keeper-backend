class Api::PostsController < Api::BaseController
  def show
    @post = Post.find(params[:id])
  end
  
  def get_comments
    @comments = Post.find(params[:id]).comments.all
  end

  def get_likes
    @likesCount = Post.find(params[:id]).likes.count(:all)
  end

  def comment
    @comment = Comment.new(comment_params)
    @comment.user = User.where(facebook_token: request.headers["facebook_token"]).first
    @comment.post = Post.find(params[:id])
    if @comment.save
      render nothing: true, :status => 200
    else
      render nothing: true, :status => 422
    end
  end

  def like
    @like = Like.new()
    @like.user = User.where(facebook_token: request.headers["facebook_token"]).first
    @like.post = Post.find(params[:id])
    if @like.save
      render nothing: true, :status => 200
    else
      render :text =>  @like.user.text, :status => 422
    end
  end
protected
  def comment_params
    params.require(:comment).permit(:body)
  end
end
