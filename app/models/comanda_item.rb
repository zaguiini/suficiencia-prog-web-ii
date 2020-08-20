class ComandaItem < ApplicationRecord
  self.table_name = 'comanda_itens'

  belongs_to :comanda
  belongs_to :produto

  before_save :assign_preco

  private

  def assign_preco
    self.preco ||= produto.preco
  end
end
