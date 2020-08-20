class Usuario < ApplicationRecord
  # I would use rolify or pundit if I had more time :)
  @@roles = %i[admin customer].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :nome, length: { minimum: 1 }
  validates :telefone, length: { is: 11 }

  validate :check_role

  @@roles.each do |role_name|
    define_method("is_#{role_name}?".to_sym) do
      role_name == role.to_sym
    end
  end

  private

  def check_role
    errors.add(:role, 'invalid role') unless @@roles.include?(role.to_sym)
  end
end
