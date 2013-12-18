class Ability
  include CanCan::Ability

  def initialize(user, params)
    # Define abilities for the passed in user here. For example:
    #
    #user ||= User.new # guest user (not logged in)

    #can :manage, :all

    if user
      can :read, User, id: user.id
      can :view, :settings
      can :new, Task
      can [:create], [Estimate, Template]
    end

    can :manage, [Estimate, Template], user_id: user.id
    can :manage, [Estimate], user.accessed_estimates.include?(:id)

    can :manage, Task do |t|
      if params.try(:[], :estimate_id)
        Estimate.find(params[:estimate_id]).try(:user_id) == user.id
      elsif params.try(:[], :template_id)
        Template.find(params[:template_id]).try(:user_id) == user.id
      elsif params.try(:[], :parent_id)
        parent = Task.find(params[:parent_id])
        parent.try(:estimate).try(:user_id) == user.id or parent.try(:template).try(:user_id) == user.id
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
