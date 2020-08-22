class ComandaItem < ApplicationRecord
  self.table_name = 'comanda_itens'

  validates :quantidade, numericality: { greater_than: 0 }
  validates :produto_id, presence: true

  belongs_to :comanda
  belongs_to :produto

  before_save :assign_preco

  private

  def assign_preco
    self.preco ||= produto.preco
  end
end
