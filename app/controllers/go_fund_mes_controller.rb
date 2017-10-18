class GoFundMesController < ApplicationController
  before_action :set_go_fund_me, only: [:show, :edit, :update, :destroy]

  # GET /go_fund_mes
  # GET /go_fund_mes.json
  def index
    @go_fund_mes = GoFundMe.all
  end

  # GET /go_fund_mes/1
  # GET /go_fund_mes/1.json
  def show
  end

  # GET /go_fund_mes/new
  def new
    @go_fund_me = GoFundMe.new
  end

  # GET /go_fund_mes/1/edit
  def edit
  end

  # POST /go_fund_mes
  # POST /go_fund_mes.json
  def create
    @go_fund_me = GoFundMe.new(go_fund_me_params)

    respond_to do |format|
      if @go_fund_me.save
        format.html { redirect_to @go_fund_me, notice: 'Go fund me was successfully created.' }
        format.json { render :show, status: :created, location: @go_fund_me }
      else
        format.html { render :new }
        format.json { render json: @go_fund_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /go_fund_mes/1
  # PATCH/PUT /go_fund_mes/1.json
  def update
    respond_to do |format|
      if @go_fund_me.update(go_fund_me_params)
        format.html { redirect_to @go_fund_me, notice: 'Go fund me was successfully updated.' }
        format.json { render :show, status: :ok, location: @go_fund_me }
      else
        format.html { render :edit }
        format.json { render json: @go_fund_me.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /go_fund_mes/1
  # DELETE /go_fund_mes/1.json
  def destroy
    @go_fund_me.destroy
    respond_to do |format|
      format.html { redirect_to go_fund_mes_url, notice: 'Go fund me was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_go_fund_me
      @go_fund_me = GoFundMe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def go_fund_me_params
      params.require(:go_fund_me).permit(:campaign, :beneficiary, :embed, :user_id)
    end
end
