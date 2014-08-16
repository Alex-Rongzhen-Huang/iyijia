class HomeController < ApplicationController
  def index
      @home_image_setting = HomeImageSetting.first
      @show_houses = ShowHouse.limit(4)
  end

end
