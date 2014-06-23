class ApplicationController < ActionController::Base
  protect_from_forgery

  def access_denied(exception)
    redirect_to new_admin_user_session_path, :alert => exception.message
  end

  protected

  def after_sign_in_path_for(resource)
    root_path  # can change to customized path like user info stuff
  end
end
