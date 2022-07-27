class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def record_not_found(error)
        render json: { message: error }, status: :not_found
    end
end

# ActiveRecord::RecordNotDestroyed
# ActiveRecord::RecordNotFound
# ActiveRecord::RecordNotSaved
# ActiveRecord::RecordNotUnique