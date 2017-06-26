class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :cpf
      t.string :nome
      t.integer :idade
      t.decimal :renda

      t.timestamps null: false
    end
  end
end
