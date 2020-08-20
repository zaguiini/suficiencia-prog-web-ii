class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  alias current_user current_usuario

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      status: '400',
      title: 'Bad Request',
      detail: resource.errors
    }, status: :bad_request
  end

  rescue_from CanCan::AccessDenied do
    render json: {
      status: 403,
      error: "You can't access this resource"
    }, status: :forbidden
  end
end
