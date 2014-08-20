# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: 'admin@21jia.net'

  # 未注册用户，提交预约测量之后，收到的修改密码的email
  def first_order_email(user, generated_password)
    @user = user
    @url  = edit_user_registration_url
    @generated_password = generated_password
    puts "################ BEGIN - first_order_email ##############"
    puts @url
    puts @user
    puts @generated_password
    puts "################ first_order_email - END   ##############"

    mail(to: @user.email, subject: '欢迎使用预约测量系统')
  end
end
