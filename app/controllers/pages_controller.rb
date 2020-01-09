class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    render layout: 'home'
  end

  def profile
    @navbar_title = "Profile Page"
    @user = User.find(user_params)
  end

  def metrics
    @visits = Ahoy::Visit.all
  end

  private
  def user_params
    params.require(:id)
  end

end
