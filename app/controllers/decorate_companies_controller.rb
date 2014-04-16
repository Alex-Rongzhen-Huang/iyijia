class DecorateCompaniesController < ApplicationController
  # GET /decorate_companies
  # GET /decorate_companies.json
  def index
    @decorate_companies = DecorateCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decorate_companies }
    end
  end

  # GET /decorate_companies/1
  # GET /decorate_companies/1.json
  def show
    @decorate_company = DecorateCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @decorate_company }
    end
  end

  # GET /decorate_companies/new
  # GET /decorate_companies/new.json
  def new
    @decorate_company = DecorateCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @decorate_company }
    end
  end

  # GET /decorate_companies/1/edit
  def edit
    @decorate_company = DecorateCompany.find(params[:id])
  end

  # POST /decorate_companies
  # POST /decorate_companies.json
  def create
    @decorate_company = DecorateCompany.new(params[:decorate_company])

    respond_to do |format|
      if @decorate_company.save
        format.html { redirect_to @decorate_company, notice: 'Decorate company was successfully created.' }
        format.json { render json: @decorate_company, status: :created, location: @decorate_company }
      else
        format.html { render action: "new" }
        format.json { render json: @decorate_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /decorate_companies/1
  # PUT /decorate_companies/1.json
  def update
    @decorate_company = DecorateCompany.find(params[:id])

    respond_to do |format|
      if @decorate_company.update_attributes(params[:decorate_company])
        format.html { redirect_to @decorate_company, notice: 'Decorate company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @decorate_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decorate_companies/1
  # DELETE /decorate_companies/1.json
  def destroy
    @decorate_company = DecorateCompany.find(params[:id])
    @decorate_company.destroy

    respond_to do |format|
      format.html { redirect_to decorate_companies_url }
      format.json { head :no_content }
    end
  end
end
