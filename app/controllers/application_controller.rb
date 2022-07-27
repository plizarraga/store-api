class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, :with => :handle_not_found
    rescue_from ActionController::ParameterMissing, :with => :handle_bad_request

    private
    def handle_not_found(error)
        render json: { message: error }, status: :not_found
    end

    def handle_bad_request(error)
        render json: { message: error }, status: :bad_request
    end
end

# ActiveRecord::RecordNotDestroyed
# ActiveRecord::RecordNotFound
# ActiveRecord::RecordNotSaved
# ActiveRecord::RecordNotUnique