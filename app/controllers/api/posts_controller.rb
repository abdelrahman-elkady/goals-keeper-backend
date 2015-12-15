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
    @comment = Comment.new(params)
    @data = JSON.parse(request.body.read)
    @comment.user = User.where(facebook_token: @data['facebook_token']).first
    @comment.post = Post.find(params[:id])
    if @comment.save
      render :status => 200
    else
      render :status => 422
    end
  end

  def like
    @likes = Post.find(params[:id]).likes.all
  end
protected
  def comment_params
    params.require(:comment).permit(:body)
  end
end
