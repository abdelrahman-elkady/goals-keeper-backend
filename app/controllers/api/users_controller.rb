class Api::UsersController < Api::BaseController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params)
    if @user.save
      render :status => 200
    else
      render :status => 422
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params)
    if @user.save
      render :status => 200
    else
      render :status => 422
    end
  end

  def user_goals
    @goals = User.find(params[:id]).goals.all
  end

  def user_posts
    @posts = User.find(params[:id]).posts.all
  end

  def user_following
    @followings = User.find(params[:id]).followings.all
  end

  def user_followers
    @followers = User.find(params[:id]).followers.all
  end
protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :facebook_token)
  end

end
