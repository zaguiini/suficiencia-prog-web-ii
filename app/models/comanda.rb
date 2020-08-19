class Comanda < ApplicationRecord
  belongs_to :usuario
  has_many :produtos, class_name: 'ComandaProduto'
  has_many :produtos_simples, through: :produtos, source: :produto, autosave: true

  accepts_nested_attributes_for :produtos, reject_if: :blank_produto_fields?

  validates_associated :produtos

  validate :produtos_length

  def produtos_length
    errors.add(:produtos, "can't be empty") if produtos.blank?
  end

  private

  def blank_produto_fields?(attributes)
    attributes.blank? || attributes['produto_id'].blank? || attributes['quantidade'].blank?
  end
end
