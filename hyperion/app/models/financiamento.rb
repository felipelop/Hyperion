class Financiamento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :imovel
end
