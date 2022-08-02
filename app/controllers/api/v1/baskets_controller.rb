class Api::V1::BasketsController < Api::V1::BaseController
  def show
    result = BasketManager::GetBasket.call(params[:id])

    if result[:status] == :success
      render json: result[:data], status: :ok
    else
      render json: { message: result[:error] }, status: :not_found
    end
  end

  def create
    result = BasketManager::SetBasket.call(basket_params)

    if result[:status] == :success
      render json: result[:data], status: :created
    else
      render json: { message: result[:error] }, status: :unprocessable_entity
    end
  end

  def destroy
    result = BasketManager::DeleteBasket.call(params[:id])

    if result[:status] == :success
      render json: {}, status: :no_content
    else
      render json: { message: result[:error] }, status: :not_found
    end
  end

  private
    def basket_params
      params.require(:basket)
        .permit(:id, items: [ :id, :name, :productName, :price, :quantity, :pictureUrl, :brand, :type ])
    end
end
