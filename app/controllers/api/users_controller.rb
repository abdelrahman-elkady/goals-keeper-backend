class Api::UsersController < Api::BaseController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render nothing: true, :status => 200
    else
      render nothing: true, :status => 422
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params)
    if @user.save
      render nothing: true, :status => 200
    else
      render nothing: true, :status => 422
    end
  end

  def user_goals
    @goals = User.find(params[:id]).goals.all
  end

  def user_posts
    @posts = User.find(params[:id]).posts.all
  end

  def user_add_goals
    @data = JSON.parse(request.body.read)
    @goal = Goal.find(@data['goal_id'])
    @user = User.find(params[:id])
    @user.goals << @goal
    render nothing: true
  end

  def user_following
    @followings = User.find(params[:id]).followings.all
  end

  def user_followers
    @followers = User.find(params[:id]).followers.all
  end
protected

  def user_params
    params.permit(:id, :first_name, :last_name, :city, :country, :gender, :date_of_birth, :profile_picture, :facebook_token, :facebook_id)
  end

end
