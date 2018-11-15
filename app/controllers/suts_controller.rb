class SutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sut, only: [:show, :edit, :update, :destroy]

  # GET /suts
  # GET /suts.json
  def index

   @search=SutSearch.new(params[:search])
   @suts=@search.scope.order("created_at DESC").page params[:page]

   respond_to do |format|
    format.html
    format.csv { send_data Sut.all.to_csv }
    format.xls
  end
end

  # GET /suts/1
  # GET /suts/1.json
  def show
  end

  # GET /suts/new
  def new
    @sut = Sut.new
  end

  # GET /suts/1/edit
  def edit
  end

  # POST /suts
  # POST /suts.json
  def create
    @sut = Sut.new(sut_params)
    @sut.date=Date.today
    respond_to do |format|
      if @sut.save
        format.html { redirect_to suts_path, notice: 'Kayıt başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @sut }
      else
        format.html { render :new }
        format.json { render json: @sut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suts/1
  # PATCH/PUT /suts/1.json
  def update
    respond_to do |format|
      if @sut.update(sut_params)
        format.html { redirect_to @sut, notice: 'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @sut }
      else
        format.html { render :edit }
        format.json { render json: @sut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suts/1
  # DELETE /suts/1.json
  def destroy
    @sut.destroy
    respond_to do |format|
      format.html { redirect_to suts_url, notice: 'Sut was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sut
      @sut = Sut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sut_params
      params.require(:sut).permit(:miktar)
    end
  end
