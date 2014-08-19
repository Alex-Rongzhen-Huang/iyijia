# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: 'admin@21jia.net'

  # 未注册用户，提交预约测量之后，收到的修改密码的email
  def first_order_email(user)
    @user = user
    @url  = 'http://example.com/login'

    mail(to: @user.email, subject: '欢迎使用预约测量系统', delivery_method_options: delivery_options)
  end
end
