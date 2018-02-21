class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit]

  # GET /businesses
  # GET /businesses.json
  def index
    if user_signed_in?
      # all businesses shown to logged in users
      @businesses = Business.all.order("created_at DESC")
    else
      # only published businesses shown 
      @businesses = Business.published.order("created_at DESC")
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    redirect_to root_path
    if user_signed_in?
      @business = current_user.businesses.build
    else
      redirect_to root_path
    end
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    if user_signed_in?
      @business = current_user.businesses.build(business_params)
    else
      @business = Business.new(business_params)
    end

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :description, :location, :phone, :facebook, :google, :yelp, :instagram, :twitter, :website, :html, :user_id, :image, :slug, :published)
    end
end
