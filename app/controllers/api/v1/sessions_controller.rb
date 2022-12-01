class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authorize_request
  
  # POST /sessions
  def create
    user = User.find_by_email(user_params[:email])

    if user&.authenticate(user_params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { email: user.email, name: user.name, token: token }, status: :ok
    else
      render json: { message: 'Unauthorized' }, status: :unauthorized
    end
 end
 
 private
 def user_params
   params.require(:user).permit(:email, :password)
 end
end
