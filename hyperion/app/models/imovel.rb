class Imovel < ActiveRecord::Base
    has_many :financiamento, :dependent => :destroy
end
