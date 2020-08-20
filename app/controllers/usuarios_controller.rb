class UsuariosController < ApplicationController
  authorize_resource

  before_action :authenticate_usuario!
  before_action :set_usuario, only: %i[show update destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render 'usuarios/index'
  end

  # GET /usuarios/1
  def show
    render 'usuarios/show'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
