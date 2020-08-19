class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render 'usuarios/index'
  end

  # GET /usuarios/1
  def show
    render 'usuarios/show'
  end

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      render 'usuarios/create', status: :created
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/1
  def update
    if @usuario.update(usuario_params.to_h.compact)
      render 'usuarios/update'
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/1
  def destroy
    @usuario.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def usuario_params
    params.except(:usuario).permit(:nome, :telefone)
  end
end
