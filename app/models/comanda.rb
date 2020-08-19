class Comanda < ApplicationRecord
  belongs_to :usuario

  has_many :itens, class_name: 'ComandaItem'
  has_many :produtos, through: :itens, autosave: true

  accepts_nested_attributes_for :itens, reject_if: :blank_item_fields?

  validates_associated :itens

  validate :itens_length

  def itens_length
    errors.add(:itens, "can't be empty") if itens.blank?
  end

  private

  def blank_item_fields?(attributes)
    attributes.blank? || attributes['produto_id'].blank? || attributes['quantidade'].blank?
  end
end
