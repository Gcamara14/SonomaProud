class BizsController < ApplicationController
  before_action :set_biz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:destroy]

  # GET /bizs
  # GET /bizs.json
  def index
    @bizs = Biz.all
  end

  # GET /bizs/1
  # GET /bizs/1.json
  def show
  end

  # GET /bizs/new
  def new
        if user_signed_in?
      @biz = Biz.new
    else
      redirect_to root_path
    end
    
  end

  # GET /bizs/1/edit
  def edit
  end

  # POST /bizs
  # POST /bizs.json
  def create
    @biz = Biz.new(biz_params)

    respond_to do |format|
      if @biz.save
        format.html { redirect_to @biz, notice: 'Biz was successfully created.' }
        format.json { render :show, status: :created, location: @biz }
      else
        format.html { render :new }
        format.json { render json: @biz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bizs/1
  # PATCH/PUT /bizs/1.json
  def update
    respond_to do |format|
      if @biz.update(biz_params)
        format.html { redirect_to @biz, notice: 'Biz was successfully updated.' }
        format.json { render :show, status: :ok, location: @biz }
      else
        format.html { render :edit }
        format.json { render json: @biz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bizs/1
  # DELETE /bizs/1.json
  def destroy
    @biz.destroy
    respond_to do |format|
      format.html { redirect_to bizs_url, notice: 'Biz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biz
      @biz = Biz.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biz_params
      params.require(:biz).permit(:name, :description, :location, :phone, :facebook, :google, :yelp, :twitter, :website, :instagram, :slug)
    end
end
