class CreateFinanciamentos < ActiveRecord::Migration
  def change
    create_table :financiamentos do |t|
      t.references :cliente, index: true, foreign_key: true
      t.references :imovel, index: true, foreign_key: true
      t.decimal :juros
      t.decimal :parcela
      t.decimal :entrada
      t.decimal :subsidio
      t.string :status

      t.timestamps null: false
    end
  end
end
