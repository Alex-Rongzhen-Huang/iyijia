class ApplicationController < ActionController::Base
  protect_from_forgery

  def access_denied(exception)
    redirect_to new_admin_user_session_path, :alert => exception.message
  end
end
