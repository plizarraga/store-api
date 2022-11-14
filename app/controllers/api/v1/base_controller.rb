class Api::V1::BaseController < ApplicationController
    include JsonWebToken
    before_action :authorize_request
    
    private
    def authorize_request
        jwt = get_jwt_from_headers(request)
        begin
            jwt_decoded = jwt_decode(jwt)
            @current_user = User.includes(:address).find(jwt_decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { message: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { message: e.message }, status: :unauthorized
        end 
    end
end