class SimulacaoController < ApplicationController
	def index
		@clientes = Cliente.all
		@imoveis = Imovel.all
		@financiamento = Financiamento.new
  		render "index"
	end


	def create
		@financiamento = Financiamento.new(financiamento_params)
	end


	private

	def financiamento_params
      params.require(:financiamento).permit(:cliente_id, :imovel_id, :juros, :parcela, :entrada, :subsidio, :status, :meses)
    end
end
