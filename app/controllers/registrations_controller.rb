class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save

    render 'usuarios/create'
  end

  def sign_up_params
    params.except(:usuario).permit(%i[email nome telefone funcao])
  end
end
