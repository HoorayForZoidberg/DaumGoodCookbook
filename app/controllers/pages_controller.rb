class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = User.find(user_params)
  end

  private
  def user_params
    params.require(:id)
  end

end
