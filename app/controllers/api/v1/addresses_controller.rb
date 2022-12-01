class Api::V1::AddressesController < Api::V1::BaseController
  
  # PUT /addresses
  def update
    address = @current_user.address
    if address.update(address_params)
      render json: AddressBlueprint.render(@current_user.address), status: :ok
    else
      render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /addresses
  def show
    render json: AddressBlueprint.render(@current_user.address), status: :ok
  end

  private
  def address_params
    params.require(:address).permit(:street, :city, :state, :zipcode)
  end
end