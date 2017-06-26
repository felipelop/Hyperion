class CreateImovels < ActiveRecord::Migration
  def change
    create_table :imovels do |t|
      t.string :nome
      t.integer :unidade
      t.decimal :valor

      t.timestamps null: false
    end
  end
end
