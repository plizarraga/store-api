class Api::V1::AddressesController < Api::V1::BaseController
  
  # PUT /addresses
  def update
    address = @current_user.address

    if address
      if address.update(address_params)
        render json: AddressBlueprint.render(address), status: :ok
      else
        render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
      end
    else
      address = Address.new(address_params)
      address.user = @current_user
      if address.save
        render json: AddressBlueprint.render(address), status: :ok
      else
        render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  # GET /addresses
  def show
    if @current_user.address
      render json: AddressBlueprint.render(@current_user.address), status: :ok
    else
      render json: { message: 'There is no address assigned to the user' }, status: :not_found
    end
  end

  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :city, :state, :zipcode)
  end
end