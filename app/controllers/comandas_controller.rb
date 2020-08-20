class ComandasController < ApplicationController
  before_action :set_comanda, only: %i[show update destroy]

  # GET /comandas
  def index
    @comandas = Comanda.all

    render 'comandas/index'
  end

  # GET /comandas/1
  def show
    render 'comandas/show'
  end

  # POST /comandas
  def create
    @comanda = Comanda.new(comanda_model_params)

    if @comanda.save
      render 'comandas/create', status: :created
    else
      render json: @comanda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comandas/1
  def update
    if @comanda.update(comanda_model_params)
      render 'comandas/update'
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
    params.except(:comanda, :id).permit(:usuario_id, itens: %i[id produto_id quantidade])
  end

  def comanda_model_params
    {
      usuario_id: comanda_params[:usuario_id],
      itens_attributes: comanda_params[:itens]
    }.compact
  end
end
