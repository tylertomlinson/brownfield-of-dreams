class UsersController < ApplicationController

  def show
    @repos = current_user.user_repos if github_user
    # require "pry"; binding.pry
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def github_user
    current_user.github_token != nil
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
