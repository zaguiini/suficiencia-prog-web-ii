class ComandaItem < ApplicationRecord
  self.table_name = 'comanda_itens'
  belongs_to :comanda
  belongs_to :produto
end
