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
    @user.update_attributes(user_params)
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
    @goal = Goal.find(@data['id'])
    @user = User.find(params[:id])
    if(@user.goals.where(:id => @data['id']).empty?)
        @user.goals << @goal
    end
    render nothing: true
  end

  def user_remove_goals
    @goal = Goal.find(params[:goal_id])
    @user = User.find(params[:id])
    @user.goals.delete(@goal)
    render nothing: true
  end

  def follow_user
    @data = JSON.parse(request.body.read)
    @to_be_followed = User.find(@data['id'])
    @user = User.find(params[:id])
    @user.followings<< @to_be_followed
    render nothing: true
  end

  def unfollow_user
    @data = JSON.parse(request.body.read)
    @to_be_unfollowed = User.find(@data['id'])
    @user = User.find(params[:id])
    @user.followings.delete(@to_be_unfollowed)
    render nothing: true
  end

  def user_followings
    @followings = User.find(params[:id]).followings.all
    if (@followings)
      render :user_followings, status: 200
    else
      render nothing: true,status: 422
    end
  end

  def user_followers
    @followers = User.find(params[:id]).followers.all
  end
protected

  def user_params
    params.permit(:id, :first_name, :last_name, :city, :country, :gender, :date_of_birth, :profile_picture, :facebook_token, :facebook_id)
  end

end
