class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  def login
    @user = User.find_by(uuid: params[:uuid])

    if @user.token == params[:token]
      auth_token = jwt_encode({ user_id: @user.id })
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
