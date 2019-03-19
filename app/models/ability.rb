class Ability
  include CanCan::Ability
    
  
  def initialize(user)
      alias_action :create, :read, :update, :destroy, to: :crud
      alias_action :create, :read, :update, to: :cru
   
    # guest user (not logged in)
    user ||= User.new 
        # start by defining rules for all users, also not logged ones
        can :read, Item 
        can :read, Post
        can :read, Review 
        can :read, Variant
        can :manage, Cart  
        #return unless user.present?
    # if the user is logged in can manage it's own posts
        can :cru, Review, user_id: user.id
        can :cru, Comment, user_id: user.id 
        can :read, Item, user_id: user.id
        can :read, Variant, user_id: user.id
        can :read, Post, user_id: user.id
        can :manage, Cart, user_id: user.id
        can :manage, Wishlist, user_id: user.id
    #return unless user.manager? # if the user is a manager we give additional permissions
  end #method initialize
end #class ability