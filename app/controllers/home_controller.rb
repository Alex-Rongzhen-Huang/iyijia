class HomeController < ApplicationController
  def index
      @home_image_setting = HomeImageSetting.first
  end

end
