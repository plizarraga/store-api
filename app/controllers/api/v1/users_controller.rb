class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authorize_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]
  
  # GET /users
  def index
    @users = User.all
    render json: UserBlueprint.render(@users), status: :ok
  end

  # GET /users/:id
  def show
    render json: UserBlueprint.render(@user), status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserBlueprint.render(@user), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
  end

  private
  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
