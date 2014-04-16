class ShowHousesController < ApplicationController
  # GET /show_houses
  # GET /show_houses.json
  def index
    @show_houses = ShowHouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @show_houses }
    end
  end

  # GET /show_houses/1
  # GET /show_houses/1.json
  def show
    @show_house = ShowHouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
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
end
