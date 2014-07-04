class DecorateSchemesController < InheritedResources::Base
  def index
    #TODO: fix user profile, use session instead
    @user_profile = UserProfile.where(:user_id => current_user.id).first()
    @user_profile ||= UserProfile.create(:user_id=>current_user.id)

    @user_profile.avatar = "http://www.gravatar.com/avatar/"+Digest::MD5.hexdigest(current_user.email)+"?d=retro" unless @user_profile.avatar.blank?

    @order = Order.where(:user_id => current_user.id).first()
    @decorate_schemes = DecorateScheme.where(:order_id => @order.id).all()
    @decorate_schemes = Kaminari.paginate_array(@decorate_schemes).page(params[:page]).per(2)


    respond_to do |format|
      format.html { render  :layout => 'user_admin'}# index.html.erb
      format.json { render json: @decorate_schemes }
    end
  end

end
