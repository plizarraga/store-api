class Api::V1::BaseController < ApplicationController
    include JsonWebToken
    before_action :authorize_request
    
    private
    def authorize_request
        authorization_header = request.headers['Authorization']
        json_web_token = authorization_header.split(' ').last if authorization_header
        begin
            jwt_decoded = jwt_decode(json_web_token)
            @current_user = User.find(jwt_decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { message: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { message: e.message }, status: :unauthorized
        end 
    end
end