class Produto < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 1 }
  validates :preco, presence: true
end
