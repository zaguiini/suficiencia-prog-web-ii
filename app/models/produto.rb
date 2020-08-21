class Produto < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 1 }, uniqueness: true
  validates :preco, presence: true
end
