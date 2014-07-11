# encoding: UTF-8
class UserAdminController < ApplicationController

  before_filter :authenticate_user!

  def order_new
    @show_house = ShowHouse.find(params[:id])

    @user_profile = UserProfile.where(:user_id => current_user.id).first()
    @user_profile ||= UserProfile.create(:user_id=>current_user.id)

    @user_profile.avatar = "http://www.gravatar.com/avatar/"+Digest::MD5.hexdigest(current_user.email)+"?d=retro" unless @user_profile.avatar.blank?

    @house_fitment = HouseFitment.new
    @order = Order.new

    respond_to do |format|
      format.html # order_new.html.erb
      format.json { render json: @house_fitment }
    end
  end

  #POST
  def pre_order
    @house_fitment = HouseFitment.new(params[:house_fitment])

    respond_to do |format|
      if @house_fitment.save
        @order = Order.where(:user_id=>@house_fitment.user_id).limit(1).first()
        if @order.nil?
          @order = Order.create(
              :house_fitment_id=>@house_fitment.id,
              :show_house_id=>@house_fitment.show_house_id,
              :user_id=>@house_fitment.user_id,
              :measure_status=>'未测量',
              :quotation_status=>'未报价'
          )
        else
          @order.update_attributes(:house_fitment_id=>@house_fitment.id,
                                   :show_house_id=>@house_fitment.show_house_id,
                                   :user_id=>@house_fitment.user_id,
                                   :measure_status=>'未测量',
                                   :quotation_status=>'未报价')
        end
        format.html { redirect_to user_profiles_path, notice: 'House fitment was successfully created.' }
        format.json { render json: @house_fitment, status: :created, location: @house_fitment }
      else
        format.html { render action: "new" }
        format.json { render json: @house_fitment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_pre_order
    # PUT /house_fitments/1
    # PUT /house_fitments/1.json
      @house_fitment = HouseFitment.find(params[:id])

      respond_to do |format|
        if @house_fitment.update_attributes(params[:house_fitment])
          format.html { redirect_to user_profiles_path, notice: 'House fitment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @house_fitment.errors, status: :unprocessable_entity }
        end
      end
  end

  def old_quotation
    @user_profile = UserProfile.where(:user_id => current_user.id).first()
    @user_profile ||= UserProfile.create(:user_id=>current_user.id)

    @user_profile.avatar = "http://www.gravatar.com/avatar/"+Digest::MD5.hexdigest(current_user.email)+"?d=retro" unless @user_profile.avatar.blank?


    @order = Order.where(:user_id=>current_user.id).limit(1).first()
    @quotation_link = @order.quotation_link
    @quotation_link ||= 'http://21jia.net/index.php'

    respond_to do |format|
      format.html { render :layout => 'user_admin'}# old_quotation.html.erb
      format.json { render json: @quotation_link }
    end
  end

end
