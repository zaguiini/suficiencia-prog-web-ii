# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(usuario)
    return if usuario.nil?

    if usuario.is_customer?
      can :manage, Comanda, usuario_id: usuario.id
      can :create, ComandaItem
    elsif usuario.is_admin?
      can :manage, :all
    end
  end
end
