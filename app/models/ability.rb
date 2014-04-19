class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
     user ||= AdminUser.new # guest user (not logged in)
     can :manage, :all

     #if user.role == 'super'
     #  can :manage, :all
     #elsif user.role == 'decorator'
     #  can :manage, DecorateCompany, :admin_user_id => user.id
     #  can :manage, ShowHousePicture
     #  can :manage, ShowHouse
     #  can :manage, ColorSurface
     #  can :read, ActiveAdmin::Page, :name => "Dashboard"
     #  #can :manage, ShowHouse do |sh|
     #  #  d = DecorateCompany.where(:admin_user_id => user.id)
     #  #  sh.decorate_company_id == d.id
     #  #end
     #  #can :manage, ShowHousePicture, :show_house_id=>{:decorate_company_id => {:admin_user_id => user.id }}
     #  #can :manage, ColorSurface, :decorate_company_id => {:admin_user_id => user.id }
     #else
     #  #can :read, :all
     #  can :manage, HouseFitment
     #  can :manage, Order
     #  can :read, ActiveAdmin::Page, :name => "Dashboard"
     #end

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
