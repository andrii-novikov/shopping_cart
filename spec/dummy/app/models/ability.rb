class Ability
  include CanCan::Ability

  def initialize(user)
    can [:manage], ShoppingCart::OrderItem
    can [:show], Product
    can [:apply], ShoppingCart::Coupon
    if user.present?
      can [:show, :update, :index, :make_order], ShoppingCart::Order, user:user
      can [:show], User, id: user.id
    end
  end
end