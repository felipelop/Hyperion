class Cliente < ActiveRecord::Base
	validates_uniqueness_of :cpf
	validates :cpf, format: { with: /\d{3}.\d{3}\.\d{3}\-\d{2}/, message: "inválido! Escreva no formato XXX.XXX.XXX-XX"}
end
