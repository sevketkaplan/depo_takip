class BakiyesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bakiye, only: [:show, :edit, :update, :destroy]

  # GET /bakiyes
  # GET /bakiyes.json
  def index
    @bakiyes = Bakiye.search(params[:search]).order("created_at DESC").page params[:page]
    respond_to do |format|
      format.html
      format.csv { send_data @bakiyes.all.to_csv }
      format.xls
    end
  end

  # GET /bakiyes/1
  # GET /bakiyes/1.json
  def show
  end

  # GET /bakiyes/new
  def new
    @bakiye = Bakiye.new
  end

  # GET /bakiyes/1/edit
  def edit
  end

  # POST /bakiyes
  # POST /bakiyes.json
  def create
    @bakiye = Bakiye.new(bakiye_params)
    @bakiye.date=Date.today
    @bakiye.toplam_borc=0
    if Bakiye.exists?(teslim_yeri: @bakiye.teslim_yeri)
     flash[:notice] = "Bu Firmanın bakiye kaydı bulunmaktadır.  !!"
     redirect_to new_urunler_path
   else
    respond_to do |format|
      if @bakiye.save
        format.html { redirect_to bakiyes_path, notice: 'Firmanın bakiye kaydı yapıldı.' }
        format.json { render :show, status: :created, location: @bakiye }
      else
        format.html { render :new }
        format.json { render json: @bakiye.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # PATCH/PUT /bakiyes/1
  # PATCH/PUT /bakiyes/1.json
  def update
    respond_to do |format|
      if @bakiye.update(bakiye_params)
        format.html { redirect_to @bakiye, notice: 'Firma bakiyesi güncellendi.' }
        format.json { render :show, status: :ok, location: @bakiye }
      else
        format.html { render :edit }
        format.json { render json: @bakiye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bakiyes/1
  # DELETE /bakiyes/1.json
  def destroy
    @bakiye.destroy
    respond_to do |format|
      format.html { redirect_to bakiyes_url, notice: 'Firma hesabı kapandı.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bakiye
      @bakiye = Bakiye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bakiye_params
      params.require(:bakiye).permit(:teslim_yeri, :toplam_borc, :date)
    end
  end
