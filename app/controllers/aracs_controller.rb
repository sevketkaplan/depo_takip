class AracsController < ApplicationController
  before_action :set_arac, only: [:show, :edit, :update, :destroy]

  # GET /aracs
  # GET /aracs.json
  def index
    @aracs = Arac.all
  end

  # GET /aracs/1
  # GET /aracs/1.json
  def show
  end

  # GET /aracs/new
  def new
    @arac = Arac.new
  end

  # GET /aracs/1/edit
  def edit
  end

  # POST /aracs
  # POST /aracs.json
  def create
    @arac = Arac.new(arac_params)

    if Arac.exists?(plaka:  @arac.plaka )
      flash[:notice] = "Bu ARAÇ zaten KAYITLI !!"
      redirect_to new_arac_path
    else
      respond_to do |format|

        if @arac.save
          format.html { redirect_to aracs_path, notice:'Kayıt başarıyla oluşturuldu.'  }
          format.json { render :show, status: :created, location: @arac }
        else
          format.html { render :new }
          format.json { render json: @arac.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /aracs/1
  # PATCH/PUT /aracs/1.json
  def update
    respond_to do |format|
      if @arac.update(arac_params)
        format.html { redirect_to @arac, notice: 'Kayıt başarıyla güncellendi.'}
        format.json { render :show, status: :ok, location: @arac }
      else
        format.html { render :edit }
        format.json { render json: @arac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aracs/1
  # DELETE /aracs/1.json
  def destroy
    @arac.destroy
    respond_to do |format|
      format.html { redirect_to aracs_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arac
      @arac = Arac.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arac_params
      params.require(:arac).permit(:plaka)
    end
  end
