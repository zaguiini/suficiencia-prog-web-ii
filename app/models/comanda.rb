class Comanda < ApplicationRecord
  belongs_to :usuario
  has_many :itens, class_name: 'ComandaItem'
  has_many :produtos, through: :itens

  accepts_nested_attributes_for :itens
  validates_associated :itens
  validates :itens, presence: true
end
