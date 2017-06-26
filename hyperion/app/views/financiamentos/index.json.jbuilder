json.array!(@financiamentos) do |financiamento|
  json.extract! financiamento, :id, :cliente_id, :imovel_id, :juros, :parcela, :entrada, :subsidio, :status, :meses
  json.url financiamento_url(financiamento, format: :json)
end
