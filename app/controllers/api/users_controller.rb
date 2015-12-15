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
      render :status => 200

    else
      render :status => 422
    end
  end

  def edit
    @user = User.find(params[:id])
  end
protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender)
  end

end
