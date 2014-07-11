class ApplicationController < ActionController::Base
  protect_from_forgery

  def access_denied(exception)
    redirect_to new_admin_user_session_path, :alert => exception.message
  end

  protected

  # make sure user get returned to previous url which requires :authenticate_user!
  before_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls

      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    if resource.instance_of? User
      session[:previous_url] || user_profiles_path # can change to customized path like user info stuff
    elsif resource.instance_of? AdminUser
      admin_dashboard_path
    end
  end
end
