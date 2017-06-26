class ImovelsController < ApplicationController
  before_action :set_imovel, only: [:show, :edit, :update, :destroy]

  # GET /imovels
  # GET /imovels.json
  def index
    @imovels = Imovel.all
  end

  # GET /imovels/1
  # GET /imovels/1.json
  def show
  end

  # GET /imovels/new
  def new
    @imovel = Imovel.new
  end

  # GET /imovels/1/edit
  def edit
  end

  # POST /imovels
  # POST /imovels.json
  def create
    @imovel = Imovel.new(imovel_params)

    respond_to do |format|
      if @imovel.save
        format.html { redirect_to @imovel, notice: 'Imóvel criado com sucesso.' }
        format.json { render :show, status: :created, location: @imovel }
      else
        format.html { render :new }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imovels/1
  # PATCH/PUT /imovels/1.json
  def update
    respond_to do |format|
      if @imovel.update(imovel_params)
        format.html { redirect_to @imovel, notice: 'Imóvel atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @imovel }
      else
        format.html { render :edit }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imovels/1
  # DELETE /imovels/1.json
  def destroy
    @imovel.destroy
    respond_to do |format|
      format.html { redirect_to imovels_url, notice: 'Imóvel destruido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imovel
      @imovel = Imovel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imovel_params
      params.require(:imovel).permit(:nome, :unidade, :valor)
    end
end
