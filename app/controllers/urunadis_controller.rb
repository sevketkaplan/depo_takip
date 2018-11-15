class UrunadisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_urunadi, only: [:show, :edit, :update, :destroy]

  # GET /urunadis
  # GET /urunadis.json
  def index
    @urunadis = Urunadi.all
    @search=SutSearch.new(params[:search])
    @suts=@search.scope

 

  end

  # GET /urunadis/1
  # GET /urunadis/1.json
  def show
  end

  # GET /urunadis/new
  def new
    @urunadi = Urunadi.new
  end

  # GET /urunadis/1/edit
  def edit
  end

  # POST /urunadis
  # POST /urunadis.json
  def create
    @urunadi = Urunadi.new(urunadi_params)
  
    if Urunadi.exists?(['adi LIKE?', @urunadi.adi])  #Person.exists?(['name LIKE ?', "%#{query}%"])
      flash[:notice] = "Bu ürün adı zaten KAYITLI !!"
      redirect_to new_urunadi_path
    else


     respond_to do |format|
        if @urunadi.save
         format.html { redirect_to urunadis_path, notice: 'Kayıt başarıyla oluşturuldu.' }
          format.json { render :show, status: :created, location: @urunadi }
       else
         format.html { render :new }
         format.json { render json: @urunadi.errors, status: :unprocessable_entity }
        end
     end
    end
  end

  # PATCH/PUT /urunadis/1
  # PATCH/PUT /urunadis/1.json
  def update
    respond_to do |format|
      if @urunadi.update(urunadi_params)
        format.html { redirect_to urunadis_path, notice:'Kayıt başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @urunadi }
      else
        format.html { render :edit }
        format.json { render json: @urunadi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urunadis/1
  # DELETE /urunadis/1.json
  def destroy
    @urunadi.destroy
    respond_to do |format|
      format.html { redirect_to urunadis_url, notice:  'Kayıt silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urunadi
      @urunadi = Urunadi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urunadi_params
      params.require(:urunadi).permit(:adi)
    end
  end
