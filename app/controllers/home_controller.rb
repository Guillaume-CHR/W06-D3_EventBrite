class HomeController < ApplicationController
	before_action :auth_user

  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
  end

	def index
	end
end
