class HarcanansutsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_harcanansut, only: [:show, :edit, :update, :destroy]

  # GET /harcanansuts
  # GET /harcanansuts.json
  def index
    @search=HarcananSearch.new(params[:search])
    @harcanansuts=@search.scope.order("created_at desc").page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data @harcanansuts.to_csv }
      format.xls
    end
  end

  # GET /harcanansuts/1
  # GET /harcanansuts/1.json
  def show
  end

  # GET /harcanansuts/new
  def new
    @harcanansut = Harcanansut.new
  end

  # GET /harcanansuts/1/edit
  def edit
  end

  # POST /harcanansuts
  # POST /harcanansuts.json
  def create
    @harcanansut = Harcanansut.new(harcanansut_params)
    @harcanansut.date=Date.today

    respond_to do |format|
      if @harcanansut.save
        format.html { redirect_to harcanansuts_path, notice: 'Kayıt başarıyla oluşturuldu.'  }
        format.json { render :show, status: :created, location: harcanansuts_path }
      else
        format.html { render :new }
        format.json { render json: @harcanansut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /harcanansuts/1
  # PATCH/PUT /harcanansuts/1.json
  def update
    respond_to do |format|
      if @harcanansut.update(harcanansut_params)
        format.html { redirect_to @harcanansut, notice: 'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @harcanansut }
      else
        format.html { render :edit }
        format.json { render json: @harcanansut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harcanansuts/1
  # DELETE /harcanansuts/1.json
  def destroy
    @harcanansut.destroy
    respond_to do |format|
      format.html { redirect_to harcanansuts_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_harcanansut
      @harcanansut = Harcanansut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def harcanansut_params
      params.require(:harcanansut).permit(:harcanan, :date)
    end
  end
