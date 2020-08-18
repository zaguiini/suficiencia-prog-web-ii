class ComandasController < ApplicationController
  before_action :set_comanda, only: [:show, :update, :destroy]

  # GET /comandas
  def index
    @comandas = Comanda.all

    render json: @comandas, include: 'usuario', except: 'usuario_id'
  end

  # GET /comandas/1
  def show
    render json: @comanda
  end

  # POST /comandas
  def create
    @comanda = Comanda.new(comanda_params)

    if @comanda.save
      render json: @comanda, status: :created, location: @comanda
    else
      render json: @comanda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comandas/1
  def update
    if @comanda.update(comanda_params)
      render json: @comanda
    else
      render json: @comanda.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comandas/1
  def destroy
    @comanda.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comanda
      @comanda = Comanda.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comanda_params
      params.fetch(:comanda, {}).permit(:usuario_id)
    end
end
