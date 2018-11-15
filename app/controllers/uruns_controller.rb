class UrunsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_urun, only: [:show, :edit, :update, :destroy]

  # GET /uruns
  # GET /uruns.json
  def index
    @search=UrunSearch.new(params[:search])
    @uruns=@search.scope.order("created_at DESC").page params[:page]

    @search=SutSearch.new(params[:search])
    @suts=@search.scope



    respond_to do |format|
      format.html
      format.csv { send_data @uruns.to_csv }
      format.xls
    end
  end

  # GET /uruns/1
  # GET /uruns/1.json
  def show
  end

  # GET /uruns/new
  def new
    @urun = Urun.new
  end

  # GET /uruns/1/edit
  def edit
  end

  # POST /uruns
  # POST /uruns.json
  def create
    @urun = Urun.new(urun_params)
    @urun.date=Date.today

    

    if !Urunler.exists?(paket_tipi: @urun.paket_tipi, adi: @urun.adi)
      flash[:notice] = "Bu ürün girişini yapmadan önce stok girişini yapınız. !!"
      redirect_to new_urun_path

    else
     respond_to do |format|
      if @urun.save

        @depo=Urunler.find_by_adi_and_paket_tipi(@urun.adi, @urun.paket_tipi)
        @depo.stok+=@urun.stok
        @depo.save

        format.html { redirect_to urunlers_path, notice: 'Kayıt başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @urun }
      else
        format.html { render :new }
        format.json { render json: @urun.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /uruns/1
  # PATCH/PUT /uruns/1.json
  def update
    respond_to do |format|
      if @urun.update(urun_params)

        @depo=Urunler.find_by_adi_and_paket_tipi(@urun.adi, @urun.paket_tipi)
        @depo.stok+=@urun.stok
        @depo.date=@urun.date
        @depo.save
        format.html { redirect_to urunlers_path, notice: 'Kayıt başarıyla güncellendi.'}
        format.json { render :show, status: :ok, location: @urun }
      else
        format.html { render :edit }
        format.json { render json: @urun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uruns/1
  # DELETE /uruns/1.json
  def destroy

    @depo=Urunler.find_by_adi_and_paket_tipi(@urun.adi, @urun.paket_tipi)
    @depo.stok-=@urun.stok
    @depo.date=@urun.date
    @depo.save
    respond_to do |format|
      format.html { redirect_to urunlers_path, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urun
      @urun = Urun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urun_params
      params.require(:urun).permit(:adi, :paket_tipi, :stok, :date)
    end
  end
