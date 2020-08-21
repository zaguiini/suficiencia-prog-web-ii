class Usuario < ApplicationRecord
  # I would use rolify or pundit if I had more time :)
  @@roles = %i[admin customer].freeze

  alias_attribute :funcao, :role

  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :nome, presence: true, length: { minimum: 1 }
  validates :telefone, presence: true, length: { is: 11 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  validate :check_role

  @@roles.each do |role_name|
    define_method("is_#{role_name}?".to_sym) do
      role_name == role.to_sym
    end
  end

  private

  def check_role
    if funcao.nil?
      self.funcao = :customer
    else
      errors.add(:funcao, 'invalid role') unless @@roles.include?(funcao.to_sym)
    end
  end
end
