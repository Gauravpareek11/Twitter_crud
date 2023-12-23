# frozen_string_literal: true

# This is Users Controller
class UsersController < ApplicationController
  before_action :authorize,only: :my_post
  def index
    # @users = User.all
    @posts = Post.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Signup Sucessfull' }
    else
      render :new
    end
  end

  def my_post 
    @posts = current_user.posts.order(created_at: :desc)
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
