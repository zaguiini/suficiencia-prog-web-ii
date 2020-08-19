class ComandaProduto < ApplicationRecord
  belongs_to :comanda
  belongs_to :produto
end
