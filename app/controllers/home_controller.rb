class HomeController < ApplicationController
  def index
      @home_image_setting = HomeImageSetting.first
      @show_houses = ShowHouse.limit(5)
  end

end
