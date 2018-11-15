class FirmagiderisController < ApplicationController
  before_action :set_firmagideri, only: [:show, :edit, :update, :destroy]

  # GET /firmagideris
  # GET /firmagideris.json
  def index
    @firmagideris = Firmagideri.search(params[:search]).order("created_at DESC").page params[:page]


    respond_to do |format|
      format.html
      format.csv { send_data @firmagideris.all.to_csv }
      format.xls
    end

  end

  # GET /firmagideris/1
  # GET /firmagideris/1.json
  def show
  end

  # GET /firmagideris/new
  def new
    @firmagideri = Firmagideri.new
  end

  # GET /firmagideris/1/edit
  def edit
  end

  # POST /firmagideris
  # POST /firmagideris.json
  def create
    @firmagideri = Firmagideri.new(firmagideri_params)

    respond_to do |format|
      if @firmagideri.save
        format.html { redirect_to firmagideris_path, notice: 'Kayıt başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @firmagideri }
      else
        format.html { render :new }
        format.json { render json: @firmagideri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firmagideris/1
  # PATCH/PUT /firmagideris/1.json
  def update
    respond_to do |format|
      if @firmagideri.update(firmagideri_params)
        format.html { redirect_to @firmagideri, notice: 'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @firmagideri }
      else
        format.html { render :edit }
        format.json { render json: @firmagideri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firmagideris/1
  # DELETE /firmagideris/1.json
  def destroy
    @firmagideri.destroy
    respond_to do |format|
      format.html { redirect_to firmagideris_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firmagideri
      @firmagideri = Firmagideri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firmagideri_params
      params.require(:firmagideri).permit(:elektrik, :su, :kira, :dogalgaz, :vergi, :yemek)
    end
  end
