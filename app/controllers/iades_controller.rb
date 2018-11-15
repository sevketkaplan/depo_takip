class IadesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_iade, only: [:show, :edit, :update, :destroy]

  # GET /iades
  # GET /iades.json
  def index
    @iades = Iade.search(params[:search]).order("created_at DESC").page params[:page]
    respond_to do |format|
      format.html
      format.csv { send_data @iades.all.to_csv }
      format.xls
    end
  end

  # GET /iades/1
  # GET /iades/1.json
  def show
  end

  # GET /iades/new
  def new
    @iade = Iade.new
  end

  # GET /iades/1/edit
  def edit
  end

  # POST /iades
  # POST /iades.json
  def create
    @iade = Iade.new(iade_params)
    @iade.date=Date.today
    @iade.dagitici=current_user.ad_soyad
    @bakiye=Bakiye.find_by_teslim_yeri(@iade.teslim_yeri)
    respond_to do |format|
      if @iade.save
        @bakiye.toplam_borc-=@iade.toplam_fiyat
        @bakiye.save
        format.html { redirect_to iades_path, notice: 'Iade was successfully created.' }

      else
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /iades/1
  # PATCH/PUT /iades/1.json
  def update
    respond_to do |format|
      if @iade.update(iade_params)
        format.html { redirect_to iades_path, notice: 'Iade was successfully updated.' }

      else
        format.html { render :edit }
        
      end
    end
  end

  # DELETE /iades/1
  # DELETE /iades/1.json
  def destroy
    @iade.destroy
    respond_to do |format|
      format.html { redirect_to iades_url, notice: 'Iade was successfully destroyed.' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iade
      @iade = Iade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iade_params
      params.require(:iade).permit(:teslim_yeri, :adi, :paket_tipi, :adet, :birim_fiyat, :toplam_fiyat, :date, :dagitici)
    end
  end
