class SatilansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_satilan, only: [:show, :edit, :update, :destroy]

  # GET /satilans
  # GET /satilans.json
  def index
    @search=Satilan.ransack(params[:q])
    @satilans=@search.result.all.order("created_at DESC").page params[:page]
    


    respond_to do |format|
      format.html
      format.csv { send_data @satilans.to_csv }
      format.xls  
    end
  end

  # GET /satilans/1
  # GET /satilans/1.json
  def show
  end

  # GET /satilans/new
  def new
    @satilan = Satilan.new
  end

  # GET /satilans/1/edit
  def edit
  end

  # POST /satilans
  # POST /satilans.json
  def create
    @satilan = Satilan.new(satilan_params)
    @satilan.user=current_user
    @satilan.date=Date.today
    @urun=Urunler.find_by_adi_and_paket_tipi(@satilan.adi, @satilan.paket_tipi)
    @bakiye=Bakiye.find_by_teslim_yeri(@satilan.teslim_yeri)
    if(@satilan.adet > @urun.stok)
      flash[:notice] = "Bu ürün için yeterli stok yoktur. !!"
      redirect_to new_satilan_path

    elsif (!Bakiye.exists?(teslim_yeri: @satilan.teslim_yeri))
     flash[:notice] = "Bu firmanın bakiye kaydı bulunmamaktadır. Lütfen oluşturunuz. !!"
     redirect_to new_satilan_path
   else
    respond_to do |format|
      if @satilan.save

        @urun.stok-=@satilan.adet
        @urun.save
        @bakiye.toplam_borc+=@satilan.toplam_fiyat
        @bakiye.save
        format.html { redirect_to satilans_path, notice: 'Kayıt başarıyla oluşturuldu.'  }
        format.json { render :show, status: :created, location: @satilan }
      else
        format.html { render :new }
        format.json { render json: @satilan.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /satilans/1
  # PATCH/PUT /satilans/1.json
  def update

   respond_to do |format|
    if @satilan.update(satilan_params)
      @bakiye=Bakiye.find_by_teslim_yeri(@satilan.teslim_yeri)
      @urun=Urunler.find_by_adi_and_paket_tipi(@satilan.adi, @satilan.paket_tipi)
      @urun.stok-=@satilan.adet
      @urun.save
      @bakiye.toplam_borc+=@satilan.toplam_fiyat
      @bakiye.save
      format.html { redirect_to satilans_path, notice: 'Kayıt başarıyla güncellendi.' }
      format.json { render :show, status: :ok, location: @satilan }
    else
      format.html { render :edit }
      format.json { render json: @satilan.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /satilans/1
  # DELETE /satilans/1.json
  def destroy
    @satilan.destroy
    @urun=Urunler.find_by_adi_and_paket_tipi(@satilan.adi, @satilan.paket_tipi)
    @urun.stok+=@satilan.adet
    @urun.save
    @bakiye.toplam_borc-=@satilan.toplam_fiyat
    @bakiye.save
    respond_to do |format|
      format.html { redirect_to satilans_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_satilan
      @satilan = Satilan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def satilan_params
      params.require(:satilan).permit(:date, :teslim_yeri, :adi, :paket_tipi, :adet, :birim_fiyat, :toplam_fiyat, :user_id)
    end
  end
