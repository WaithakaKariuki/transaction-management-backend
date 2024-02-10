class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true 
    protect_from_forgery with: :null_session

    rescue_from ActionController::MethodNotAllowed, with: :render_method_not_allowed

    private
  
    def render_method_not_allowed(exception)
      render json: { error: "Method Not Allowed: #{exception.message}" }, status: :method_not_allowed
    end
end
