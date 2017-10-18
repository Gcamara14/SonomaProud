class GoFundMesController < ApplicationController
  before_action :set_go_fund_me, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /go_fund_mes
  # GET /go_fund_mes.json
  def index
    @go_fund_mes = GoFundMe.all.order("created_at DESC")
  end

  # GET /go_fund_mes/1
  # GET /go_fund_mes/1.json
  def show
  end

  # GET /go_fund_mes/new
  def new
    @go_fund_me = current_user.go_fund_mes.build
  end

  # GET /go_fund_mes/1/edit
  def edit
  end

  # POST /go_fund_mes
  # POST /go_fund_mes.json
  def create
    @go_fund_me = current_user.go_fund_mes.build(go_fund_me_params)

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
      @go_fund_me = GoFundMe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def go_fund_me_params
      params.require(:go_fund_me).permit(:campaign, :beneficiary, :embed, :user_id, :slug)
    end

    def require_same_user
      if @go_fund_me.user != current_user
        flash[:alert] = "That is not your post... you can't edit that!"
        redirect_to root_path
      end
    end

end
