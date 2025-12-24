class CreateCategoria < ActiveRecord::Migration[7.2]
  def change
    create_table :categorias do |t|
      t.string :nome, null: false
      t.string :sexo, null: false
      t.integer :idade, null: false
      t.timestamps
    end
    add_index :categorias, :nome
    add_index :categorias, :sexo
    add_index :categorias, :idade
  end
end
