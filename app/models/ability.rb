class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new 
    if user.admin?
        can :manage, :all
    elsif user.user?
        can :read, :all
        can :create, Blog
        can [:edit, :update, :destroy], Blog do |blog|
            blog.try(:user) == user
        end
        can [:edit, :update, :destroy], Post do |post|
            post.try(:blog).try(:user) == user
        end
        can :destroy, Comment do |comment|
            comment.try(:user) == user
        end 
        can :edit, User do |user|
            user.try(:user) == user
        end
    else
        can :index, Blog do |blog|
            blog.try(:user) == user
        end
    end
   
  end
  def user_of_post(post)
    blog = post.blog_id
    user = blog.user_id
    user
  end 
end