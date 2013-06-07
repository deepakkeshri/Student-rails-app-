class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #can :read, :all
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
      
    else if user.has_role? :teacher
        can :add_user, :all
        can :read, :all  
        can :del, user  #do |f|
        #  f.user == user
       # end
       can :edit, @user
       # can :edit1, user  #, :category => {:has_role => :student  }
      #can :update, :all, :category => {:has_role => :student  }
      else
        can :read, :all
        #if user==current_user
        can :edit, @user #do |f|
         # f.role="student"
       #end  #,:user => user.id#,:category => {:has_role => :student  }
         can :role, user
      end
    end
    
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
