class Comanda < ApplicationRecord
  belongs_to :usuario
  has_many :comanda_produtos
  has_many :produtos, through: :comanda_produtos, autosave: true

  accepts_nested_attributes_for :comanda_produtos, reject_if: :blank_produto_fields?

  validates_associated :comanda_produtos

  validate :produtos_length
  validates :usuario_id, presence: true

  def produtos_length
    errors.add(:produtos, "can't be empty") if comanda_produtos.blank?
  end

  private

  def blank_produto_fields?(attributes)
    attributes.blank? || attributes['produto_id'].blank? || attributes['quantidade'].blank?
  end
end
