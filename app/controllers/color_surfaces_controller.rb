class ColorSurfacesController < ApplicationController
  # GET /color_surfaces
  # GET /color_surfaces.json
  def index
    @color_surfaces = ColorSurface.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @color_surfaces }
    end
  end

  # GET /color_surfaces/1
  # GET /color_surfaces/1.json
  def show
    @color_surface = ColorSurface.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @color_surface }
    end
  end

  # GET /color_surfaces/new
  # GET /color_surfaces/new.json
  def new
    @color_surface = ColorSurface.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @color_surface }
    end
  end

  # GET /color_surfaces/1/edit
  def edit
    @color_surface = ColorSurface.find(params[:id])
  end

  # POST /color_surfaces
  # POST /color_surfaces.json
  def create
    @color_surface = ColorSurface.new(params[:color_surface])

    respond_to do |format|
      if @color_surface.save
        format.html { redirect_to @color_surface, notice: 'Color surface was successfully created.' }
        format.json { render json: @color_surface, status: :created, location: @color_surface }
      else
        format.html { render action: "new" }
        format.json { render json: @color_surface.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /color_surfaces/1
  # PUT /color_surfaces/1.json
  def update
    @color_surface = ColorSurface.find(params[:id])

    respond_to do |format|
      if @color_surface.update_attributes(params[:color_surface])
        format.html { redirect_to @color_surface, notice: 'Color surface was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @color_surface.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_surfaces/1
  # DELETE /color_surfaces/1.json
  def destroy
    @color_surface = ColorSurface.find(params[:id])
    @color_surface.destroy

    respond_to do |format|
      format.html { redirect_to color_surfaces_url }
      format.json { head :no_content }
    end
  end
end
