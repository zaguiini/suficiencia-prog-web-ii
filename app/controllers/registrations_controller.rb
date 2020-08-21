class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save

    if resource.save
      render 'usuarios/create'
    else
      render json: @usuario.errors, status: :bad_request
    end
  end

  def sign_up_params
    params.except(:usuario, :funcao, :registration).permit(%i[email nome telefone password])
  end
end
