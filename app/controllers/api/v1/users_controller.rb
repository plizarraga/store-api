class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authorize_request, only: [:create, :email_exists]
  
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserBlueprint.render(@user), status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  # GET /users/current_user
  def current_user
    jwt = get_jwt_from_headers(request)
    render json: { email: @current_user.email, name: @current_user.name, token: jwt }, status: :ok
  end

  # GET /email-exists
  def email_exists
    email_found = !!User.find_by_email(params[:email])
    render json: email_found, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
