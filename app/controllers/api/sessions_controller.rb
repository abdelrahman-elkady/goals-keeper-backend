class Api::SessionsController < Api::BaseController

  def create
      @data = JSON.parse(request.body.read)
      @user = User.from_facebook_token(@data['token'])

      if(@user)
        render json: user.id
      end
  end

end
