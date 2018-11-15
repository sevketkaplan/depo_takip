class PersonelgiderisController < ApplicationController
  before_action :set_personelgideri, only: [:show, :edit, :update, :destroy]

  # GET /personelgideris
  # GET /personelgideris.json
  def index
    @personelgideris = Personelgideri.all.order("created_at DESC").page params[:page]


    respond_to do |format|
      format.html
      format.csv { send_data @personelgideris.all.to_csv }
      format.xls
    end
  end

  # GET /personelgideris/1
  # GET /personelgideris/1.json
  def show
  end

  # GET /personelgideris/new
  def new
    @personelgideri = Personelgideri.new
  end

  # GET /personelgideris/1/edit
  def edit
  end

  # POST /personelgideris
  # POST /personelgideris.json
  def create
    @personelgideri = Personelgideri.new(personelgideri_params)

    respond_to do |format|
      if @personelgideri.save
        format.html { redirect_to personelgideris_path, notice: 'Kayıt başarıyla oluşturuldu.'  }
        format.json { render :show, status: :created, location: @personelgideri }
      else
        format.html { render :new }
        format.json { render json: @personelgideri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personelgideris/1
  # PATCH/PUT /personelgideris/1.json
  def update
    respond_to do |format|
      if @personelgideri.update(personelgideri_params)
        format.html { redirect_to @personelgideri, notice:'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @personelgideri }
      else
        format.html { render :edit }
        format.json { render json: @personelgideri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personelgideris/1
  # DELETE /personelgideris/1.json
  def destroy
    @personelgideri.destroy
    respond_to do |format|
      format.html { redirect_to personelgideris_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personelgideri
      @personelgideri = Personelgideri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personelgideri_params
      params.require(:personelgideri).permit(:maas, :sigorta)
    end
  end
