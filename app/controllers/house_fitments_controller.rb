# encoding: UTF-8
class HouseFitmentsController < ApplicationController
  # GET /house_fitments
  # GET /house_fitments.json
  def index
    @house_fitments = HouseFitment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @house_fitments }
    end
  end

  # GET /house_fitments/1
  # GET /house_fitments/1.json
  def show
    @house_fitment = HouseFitment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house_fitment }
    end
  end

  # GET /house_fitments/new
  # GET /house_fitments/new.json
  def new
    @house_fitment = HouseFitment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house_fitment }
    end
  end

  # GET /house_fitments/1/edit
  def edit
    @house_fitment = HouseFitment.find(params[:id])
  end

  # POST /house_fitments
  # POST /house_fitments.json
  def create
    @house_fitment = HouseFitment.new(params[:house_fitment])

    respond_to do |format|
      if @house_fitment.save
        format.html { redirect_to @house_fitment, notice: 'House fitment was successfully created.' }
        format.json { render json: @house_fitment, status: :created, location: @house_fitment }
      else
        format.html { render action: "new" }
        format.json { render json: @house_fitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /house_fitments/1
  # PUT /house_fitments/1.json
  def update
    @house_fitment = HouseFitment.find(params[:id])

    respond_to do |format|
      if @house_fitment.update_attributes(params[:house_fitment])
        format.html { redirect_to user_orders_path, notice: '订单信息修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house_fitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_fitments/1
  # DELETE /house_fitments/1.json
  def destroy
    @house_fitment = HouseFitment.find(params[:id])
    @house_fitment.destroy

    respond_to do |format|
      format.html { redirect_to house_fitments_url }
      format.json { head :no_content }
    end
  end
end
