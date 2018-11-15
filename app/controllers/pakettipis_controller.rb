class PakettipisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pakettipi, only: [:show, :edit, :update, :destroy]

  # GET /pakettipis
  # GET /pakettipis.json
  def index
    @pakettipis = Pakettipi.all

    @search=SutSearch.new(params[:search])
    @suts=@search.scope

 

  end

  # GET /pakettipis/1
  # GET /pakettipis/1.json
  def show
  end


  # GET /pakettipis/new
  def new
    @pakettipi = Pakettipi.new
  end

  # GET /pakettipis/1/edit
  def edit
  end

  # POST /pakettipis
  # POST /pakettipis.json
  def create
    @pakettipi = Pakettipi.new(pakettipi_params)

    
    if Pakettipi.exists?(paket_tipi:  @pakettipi.paket_tipi, urunadi_id: @pakettipi.urunadi_id)
      flash[:notice] = "Bu paket tipi zaten KAYITLI !!"
      redirect_to new_pakettipi_path
    else
      respond_to do |format|
        if @pakettipi.save
          format.html { redirect_to pakettipis_path, notice:'Kayıt başarıyla oluşturuldu.' }
          format.json { render :show, status: :created, location: @pakettipi }
        else
          format.html { render :new }
          format.json { render json: @pakettipi.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # PATCH/PUT /pakettipis/1
  # PATCH/PUT /pakettipis/1.json
  def update
    respond_to do |format|
      if @pakettipi.update(pakettipi_params)
        format.html { redirect_to pakettipis_path, notice: 'Kayıt başarıyla güncellendi.'}
        format.json { render :show, status: :ok, location: @pakettipi }
      else
        format.html { render :edit }
        format.json { render json: @pakettipi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pakettipis/1
  # DELETE /pakettipis/1.json
  def destroy
    @pakettipi.destroy
    respond_to do |format|
      format.html { redirect_to pakettipis_path, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pakettipi
      @pakettipi = Pakettipi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pakettipi_params
      params.require(:pakettipi).permit(:paket_tipi, :urunadi_id)
    end
  end
