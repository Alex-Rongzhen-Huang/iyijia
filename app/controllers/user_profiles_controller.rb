class UserProfilesController < InheritedResources::Base
  def index

    @user_profile = UserProfile.where(:user_id => current_user.id).first()
    @user_profile ||= UserProfile.create()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_profile }
    end
  end
end
