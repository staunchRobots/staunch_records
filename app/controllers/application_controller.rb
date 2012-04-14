class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin
    redirect_to root_path, notice: 'You should be admin to access that' if current_user.nil? || !current_user.admin
  end
end
