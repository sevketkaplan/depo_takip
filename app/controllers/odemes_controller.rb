class OdemesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_odeme, only: [:show, :edit, :update, :destroy]

  # GET /odemes
  # GET /odemes.json
  def index
    @odemes = Odeme.search(params[:search]).order("created_at DESC").page params[:page]
    respond_to do |format|
      format.html
      format.csv { send_data @odemes.all.to_csv }
      format.xls
    end
  end

  # GET /odemes/1
  # GET /odemes/1.json
  def show
  end

  # GET /odemes/new
  def new
    @odeme = Odeme.new
  end

  # GET /odemes/1/edit
  def edit
  end

  # POST /odemes
  # POST /odemes.json
  def create
    @odeme = Odeme.new(odeme_params)
    @odeme.date=Date.today
    @odeme.dagitici=current_user.ad_soyad

    if !Bakiye.exists?(teslim_yeri: (@odeme.teslim_yeri))
     flash[:notice] = "Bu firmanın bakiye kaydı bulunmamaktadır. Lütfen oluşturunuz. !!"
     redirect_to new_odeme_path
   else
    respond_to do |format|
      if @odeme.save
        @bakiye=Bakiye.find_by_teslim_yeri(@odeme.teslim_yeri)
        @bakiye.toplam_borc-=@odeme.odeme_miktari
        @bakiye.save
        format.html { redirect_to odemes_path, notice: 'Odeme was successfully created.' }
        format.json { render :show, status: :created, location: @odeme }
      else
        format.html { render :new }
        format.json { render json: @odeme.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # PATCH/PUT /odemes/1
  # PATCH/PUT /odemes/1.json
  def update
    respond_to do |format|
      if @odeme.update(odeme_params)
        @bakiye=Bakiye.find_by_teslim_yeri(@odeme.teslim_yeri)
        @bakiye.toplam_borc-=@odeme.odeme_miktari
        @bakiye.save
        format.html { redirect_to odemes_path, notice: 'Odeme was successfully updated.' }
        format.json { render :show, status: :ok, location: @odeme }
      else
        format.html { render :edit }
        format.json { render json: @odeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odemes/1
  # DELETE /odemes/1.json
  def destroy
    @odeme.destroy
    @bakiye=Bakiye.find_by_teslim_yeri(@odeme.teslim_yeri)
    @bakiye.toplam_borc+=@odeme.odeme_miktari
    @bakiye.save
    respond_to do |format|
      format.html { redirect_to odemes_url, notice: 'Odeme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odeme
      @odeme = Odeme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odeme_params
      params.require(:odeme).permit(:teslim_yeri, :odeme_miktari, :dagitici, :date)
    end
  end
