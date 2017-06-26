json.array!(@imovels) do |imovel|
  json.extract! imovel, :id, :nome, :unidade, :valor
  json.url imovel_url(imovel, format: :json)
end
