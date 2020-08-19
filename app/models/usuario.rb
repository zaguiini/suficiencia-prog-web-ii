class Usuario < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 1 }
  validates :telefone, presence: true, length: { is: 11 }
end
