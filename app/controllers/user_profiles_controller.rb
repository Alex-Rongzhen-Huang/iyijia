# encoding: UTF-8
class UserProfilesController < InheritedResources::Base

  def index
    @user_profile ||= session[:user_profile]

    @show_houses = current_user.votes.up.for_type(ShowHouse).votables
    @show_houses = Kaminari.paginate_array(@show_houses).page(params[:page]).per(2)

    @house_fitment = HouseFitment.where(:user_id => current_user.id).last()
    @submitted_house_fitment = @house_fitment
    @house_fitment ||= HouseFitment.create(:user_id=>current_user.id)

    respond_to do |format|
      format.html { render :layout => 'user_admin'}# index.html.erb
      format.json { render json: @user_profile }
    end
  end

  # PUT /user_profiles/1
  # PUT /user_profiles/1.json
  def update
    @user_profile = UserProfile.find(params[:id])

    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        session[:user_profile] = @user_profile
        format.html { redirect_to user_orders_path, notice: '用户资料已更新！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end


end
