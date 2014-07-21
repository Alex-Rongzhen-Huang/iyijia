# encoding: UTF-8
class UserAdminController < ApplicationController

  before_filter :authenticate_user!
  
  def favorites
    @user_profile = session[:user_profile]

    @show_houses = current_user.votes.up.for_type(ShowHouse).votables
    @show_houses = Kaminari.paginate_array(@show_houses).page(params[:page]).per(8)

    respond_to do |format|
      format.html { render :layout => 'user_admin'}# index.html.erb
      format.json { render json: @favorites }
    end
  end
  
  def like
    @show_house = ShowHouse.find(params[:id])
    @show_house.liked_by current_user

    respond_to do |format|
      format.json { render json: @show_house }
    end
  end

  def unlike
    @show_house = ShowHouse.find(params[:id])
    @show_house.downvote_from current_user

    respond_to do |format|
      format.json { render json: @show_house }
    end
  end
  
  def order_del
    @order = Order.where(:id=>params[:id]).limit(1).first()
    @user_profile = session[:user_profile]
    
    @return_msg = "Unknown return result"
    
    if @order.user_id = @user_profile.user_id
      if @order.destroy
        @return_msg = "Order was successfully deleted."
      else
        @return_msg = "Order delete fail."
      end
    else
      @return_msg = "This order is not belong to you!"
    end
    
    respond_to do |format|
      format.html { redirect_to user_orders_path, notice: @return_msg }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
      
  end
  
  def order_new
    @show_house = ShowHouse.find(params[:id])
    @user_profile = session[:user_profile]

    @house_fitment = HouseFitment.new
    @order = Order.new

    respond_to do |format|
      format.html # order_new.html.erb
      format.json { render json: @house_fitment }
    end
  end
  

  
  def user_orders
    @user_orders = Order.where(:user_id=>current_user.id)

    @user_profile = session[:user_profile]
    @user_orders = Kaminari.paginate_array(@user_orders).page(params[:page]).per(8)
 
    respond_to do |format|
      format.html { render :layout => 'user_admin'} # user_orders.html.erb
      format.json { render json: @user_orders }
    end
    
  end

  #POST
  def pre_order
    @house_fitment = HouseFitment.new(params[:house_fitment])
    puts   params[:house_fitment]
    @user_orders = Order.where(:user_id => current_user.id)
    
    respond_to do |format|
      if @house_fitment.save
        
        @order = Order.new
        
        @order = Order.create(
              :house_fitment_id=>@house_fitment.id,
              :show_house_id=>@house_fitment.show_house_id,
              :user_id=>@house_fitment.user_id,
              :measure_status=>'未测量',
              :quotation_status=>'未报价'
          )
        
        unless @order.save
          # TODO: Add hints for order save error
        end

      if @order.save
        
        @my_project = MyProject.create(
              :name=>"未维护",
              :order_id=>@order.id
          )
          
        @decorate_scheme = DecorateScheme.create(
              :name=>"未维护",
              :order_id=>@order.id
          )
        
        unless @my_project.save
          # TODO: Add hints for order save error
        end
        
        unless @decorate_scheme.save
          # TODO: Add hints for order save error
        end
      end
            
        #  @order.update_attributes(:house_fitment_id=>@house_fitment.id,
        #                           :show_house_id=>@house_fitment.show_house_id,
        #                           :user_id=>@house_fitment.user_id,
        #                           :measure_status=>'未测量',
        #                           :quotation_status=>'未报价')
        
        format.html { redirect_to user_orders_path, notice: '已成功生成订单.' }
        format.json { render json: @house_fitment, status: :created, location: @house_fitment }
      else
        # If save failed, required to input again.
        # TODO: Add more hints for validation fail
        format.html { redirect_to order_new_path(@house_fitment.show_house_id) }
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
    @user_profile = session[:user_profile]

    @order = Order.where(:user_id=>current_user.id).limit(1).first()
    @quotation_link = @order.quotation_link unless @order.nil?
    @quotation_link ||= 'http://21jia.net/index.php'

    respond_to do |format|
      format.html { render :layout => 'user_admin'}# old_quotation.html.erb
      format.json { render json: @quotation_link }
    end
  end

end
