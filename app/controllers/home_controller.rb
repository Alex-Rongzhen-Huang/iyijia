# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @home_image_setting = HomeImageSetting.first
    @show_houses = ShowHouse.limit(4)

    @house_fitment = HouseFitment.new
  end

  #POST
  def pre_order
    @house_fitment = HouseFitment.new(params[:house_fitment])
    #generated_password = Devise.friendly_token.first(8)
    generated_password = 12345678
    @user = User.create(:email => params[:house_fitment][:email], :password => generated_password)
    if @user.save
      # TODO: send user about register information
      # RegistrationMailer.welcome(user, generated_password).deliver
    else
      puts '此邮箱已有关联用户存在.'
      @user = User.find_by_email (params[:house_fitment][:email])
    end

    respond_to do |format|
      if @house_fitment.save
        @order = Order.create(
            :house_fitment_id => @house_fitment.id,
            :show_house_id => ShowHouse.first.id,
            :user_id => @user.id,
            :measure_status => '未测量',
            :quotation_status => '未报价'
        )
        if @order.save
          @my_project = MyProject.create(:name => "未维护",:order_id => @order.id)
          @decorate_scheme = DecorateScheme.create(:name => "未维护",:order_id => @order.id, :confirm_status => "未确认" )

          unless @my_project.save
            puts "我家的工程保存失败 #{@house_fitment} - #{@order}"
          end

          unless @decorate_scheme.save
            puts "装修方案保存失败 #{@house_fitment} - #{@order}"
          end
        else
          puts @order.errors
        end


        format.html { redirect_to root_path, notice: '已成功提交预约信息。 您可以查看邮件，登陆本站跟踪进度' }
      else
        @home_image_setting = HomeImageSetting.first
        @show_houses = ShowHouse.limit(4)
        format.html { render action: 'index' }
      end
    end

  end
end
