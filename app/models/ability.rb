class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user_signed_in?

    can :read, :all
    can :destroy, Food, user: user
    can :destroy, Recipe, user:
  end
end
