class AracgiderisController < ApplicationController
  before_action :set_aracgideri, only: [:show, :edit, :update, :destroy]

  # GET /aracgideris
  # GET /aracgideris.json
  def index
    @aracgideris = Aracgideri.search(params[:search]).order("created_at DESC").page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data @aracgideris.all.to_csv }
      format.xls
    end
  end

  # GET /aracgideris/1
  # GET /aracgideris/1.json
  def show
  end

  # GET /aracgideris/new
  def new
    @aracgideri = Aracgideri.new
  end

  # GET /aracgideris/1/edit
  def edit
  end

  # POST /aracgideris
  # POST /aracgideris.json
  def create
    @aracgideri = Aracgideri.new(aracgideri_params)

    respond_to do |format|
      if @aracgideri.save
        format.html { redirect_to aracgideris_path, notice: 'Kayıt başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @aracgideri }
      else
        format.html { render :new }
        format.json { render json: aracgideris_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aracgideris/1
  # PATCH/PUT /aracgideris/1.json
  def update
    respond_to do |format|
      if @aracgideri.update(aracgideri_params)
        format.html { redirect_to @aracgideri, notice: 'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @aracgideri }
      else
        format.html { render :edit }
        format.json { render json: @aracgideri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aracgideris/1
  # DELETE /aracgideris/1.json
  def destroy
    @aracgideri.destroy
    respond_to do |format|
      format.html { redirect_to aracgideris_url, notice: 'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aracgideri
      @aracgideri = Aracgideri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aracgideri_params
      params.require(:aracgideri).permit(:yakit, :mtv, :bakim, :sigorta, :kasko, :plaka)
    end
  end
