class FinanciamentosController < ApplicationController
  before_action :set_financiamento, only: [:show, :edit, :update, :destroy, :aceita, :recusa]

  # GET /financiamentos
  # GET /financiamentos.json
  def index
    @financiamentos = Financiamento.all
  end

  def aceita
    @financiamento.status = "ACEITO"
    @financiamento.save

    respond_to do |format|
        format.html { redirect_to @financiamento, notice: 'Financiamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @financiamento }
    end
  end

  def recusa
    @financiamento.status = "NAO_ACEITO"
    @financiamento.save

    respond_to do |format|
        format.html { redirect_to @financiamento, notice: 'Financiamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @financiamento }
    end
  end

  # GET /financiamentos/1
  # GET /financiamentos/1.json
  def show
  end

  # GET /financiamentos/new
  def new
    @financiamento = Financiamento.new
    @cliente = Cliente.all
    @imovel = Imovel.all
  end

  # GET /financiamentos/1/edit
  def edit
  end

  # POST /financiamentos
  # POST /financiamentos.json
  def create
    @financiamento = Financiamento.new(financiamento_params)
    cliente = Cliente.find(@financiamento.cliente_id)
    imovel = Imovel.find(@financiamento.imovel_id)
    if(cliente.idade < 18 or cliente.idade >= 65)
      @financiamento.status = "NEGADO"
      @financiamento.meses = nil
    elsif(cliente.renda < 500.00 or cliente.renda > 3499.99)
      @financiamento.status = "NEGADO"
      @financiamento.meses = nil
    elsif(imovel.valor > 180000.00)
      @financiamento.status = "NEGADO"
      @financiamento.meses = nil
    else
      @financiamento.entrada = (cliente.renda * 5).round(2)
      if(cliente.idade >= 18 and cliente.idade < 26) 
        percentual_idade = 0.03
      elsif(cliente.idade >= 26 and cliente.idade < 35)
        percentual_idade = 0.025
      else
        percentual_idade = 0.02
      end
      if(cliente.renda >= 500.00 and cliente.renda < 1500.00) 
        percentual_renda = 0.03
        @financiamento.juros = 0.02
      elsif(cliente.renda >= 1500.00 and cliente.renda < 2500.00)
        percentual_renda = 0.025
        @financiamento.juros = 0.015
      else
        percentual_renda = 0.015
        @financiamento.juros = 0.01
      end
      @financiamento.subsidio = ((percentual_renda + percentual_idade)* imovel.valor).round(2)
      @financiamento.parcela = (((imovel.valor - @financiamento.subsidio - @financiamento.subsidio) *
      (1 + @financiamento.juros**(Integer(@financiamento.meses/12))))/@financiamento.meses).round(2)
      if(@financiamento.parcela > (cliente.renda/2))
        @financiamento.status = "INVIAVEL"
      else
        @financiamento.status = "SIMULACAO"
      end
      @financiamento.save
    end

    respond_to do |format|
      if @financiamento.save
        format.html { redirect_to @financiamento, notice: 'Financiamento was successfully created.' }
        format.json { render :show, status: :created, location: @financiamento }
      else
        format.html { render :new }
        format.json { render json: @financiamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financiamentos/1
  # PATCH/PUT /financiamentos/1.json
  def update
    respond_to do |format|
      if @financiamento.update(financiamento_params)
        format.html { redirect_to @financiamento, notice: 'Financiamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @financiamento }
      else
        format.html { render :edit }
        format.json { render json: @financiamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financiamentos/1
  # DELETE /financiamentos/1.json
  def destroy
    @financiamento.destroy
    respond_to do |format|
      format.html { redirect_to financiamentos_url, notice: 'Financiamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financiamento
      @financiamento = Financiamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financiamento_params
      params.require(:financiamento).permit(:cliente_id, :imovel_id, :juros, :parcela, :entrada, :subsidio, :status, :meses)
    end
end
