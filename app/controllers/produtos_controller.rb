class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :update, :destroy]

  # GET /produtos
  def index
    @produtos = Produto.all

    render 'produtos/index'
  end

  # GET /produtos/1
  def show
    render 'produtos/show'
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      render 'produtos/create', status: :created
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params.to_h.compact)
      render 'produtos/update'
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_produto
    @produto = Produto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def produto_params
    params.permit(:nome, :preco)
  end
end
