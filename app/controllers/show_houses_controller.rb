class ShowHousesController < ApplicationController
  # GET /show_houses
  # GET /show_houses.json
  def index

    area_from,area_to = params[:area].split('-') unless (params[:area].blank? || params[:area] == 'all')
    price_from,price_to = params[:price].split('-')  unless (params[:price].blank? || params[:price] == 'all')

    @show_houses = ShowHouse.where(nil)
    @show_houses = @show_houses.style_as(params[:style]) unless (params[:style].blank? || params[:style] == 'all')
    @show_houses = @show_houses.usage_as(params[:usage]) unless (params[:usage].blank? || params[:usage] == 'all')
    if valid_number_range?(params[:area])
      @show_houses = @show_houses.area_in(area_from, area_to) unless (params[:area].blank? || params[:area] == 'all')
    end
    if valid_number_range?(params[:price])
      @show_houses = @show_houses.price_in(price_from, price_to) unless (params[:price].blank? || params[:price] == 'all')
    end

    @show_houses = @show_houses.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @show_houses }
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

  # GET /show_houses/1
  # GET /show_houses/1.json
  def show
    @show_house = ShowHouse.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'legacy'}# show.html.erb
      format.json { render json: @show_house }
    end
  end

  # GET /show_houses/new
  # GET /show_houses/new.json
  def new
    @show_house = ShowHouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @show_house }
    end
  end

  # GET /show_houses/1/edit
  def edit
    @show_house = ShowHouse.find(params[:id])
  end

  # POST /show_houses
  # POST /show_houses.json
  def create
    @show_house = ShowHouse.new(params[:show_house])

    respond_to do |format|
      if @show_house.save
        format.html { redirect_to @show_house, notice: 'Show house was successfully created.' }
        format.json { render json: @show_house, status: :created, location: @show_house }
      else
        format.html { render action: "new" }
        format.json { render json: @show_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /show_houses/1
  # PUT /show_houses/1.json
  def update
    @show_house = ShowHouse.find(params[:id])

    respond_to do |format|
      if @show_house.update_attributes(params[:show_house])
        format.html { redirect_to @show_house, notice: 'Show house was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @show_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_houses/1
  # DELETE /show_houses/1.json
  def destroy
    @show_house = ShowHouse.find(params[:id])
    @show_house.destroy

    respond_to do |format|
      format.html { redirect_to show_houses_url }
      format.json { head :no_content }
    end
  end

  private
  def valid_number_range?(range)
    valid_range_regex = /([0-9]+)(-)([0-9]+)/
    range.present? && range.match(valid_range_regex)
  end
end
