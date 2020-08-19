class Comanda < ApplicationRecord
  belongs_to :usuario
  has_many :comanda_produtos, autosave: true
end
