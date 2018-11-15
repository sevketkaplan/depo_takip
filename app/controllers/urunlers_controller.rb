class UrunlersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_urunler, only: [:show, :edit, :update, :destroy]

  # GET /urunlers
  # GET /urunlers.json
  def index
   @urunlers=Urunler.all

   @search=SutSearch.new(params[:search])
   @suts=@search.scope


   respond_to do |format|
    format.html
    format.csv { send_data Urunler.all.to_csv }
    format.xls
  end
end

  # GET /urunlers/1
  # GET /urunlers/1.json
  def show
  end

  # GET /urunlers/new
  def new
    @urunler = Urunler.new
  end

  # GET /urunlers/1/edit

  def edit
  end

  # POST /urunlers
  # POST /urunlers.json
  def create
    @urunler = Urunler.new(urunler_params)
    @urunler.date=Date.today
    @urunler.stok=0
    if Urunler.exists?(adi: @urunler.adi, paket_tipi: @urunler.paket_tipi)
     flash[:notice] = "Bu Ürün kaydı bulunmaktadır!"
     redirect_to new_urunler_path
   else
    respond_to do |format|
      if @urunler.save


        format.html { redirect_to urunlers_path, notice: 'Kayıt başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @urunler }
      else
        format.html { render :new }
        format.json { render json: @urunler.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /urunlers/1
  # PATCH/PUT /urunlers/1.json
  def update
    respond_to do |format|
      if @urunler.update(urunler_params)

        format.html { redirect_to urunlers_path, notice: 'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @urunler }
      else
        format.html { render :edit }
        format.json { render json: @urunler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urunlers/1
  # DELETE /urunlers/1.json
  def destroy
    @urunler.destroy
    respond_to do |format|
      format.html { redirect_to urunlers_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urunler
      @urunler = Urunler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urunler_params
      params.require(:urunler).permit(:adi, :paket_tipi, :stok)
    end
  end
