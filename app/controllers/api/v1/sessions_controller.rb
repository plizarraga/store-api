class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authorize_request
  
  # POST /sessions
  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { email: user.email, name: user.name, token: token }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
