class CreateCategoria < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:categorias)

    create_table :categorias do |t|
      t.string :nome, null: false
      t.string :sexo, null: false
      t.integer :idade, null: false
      t.timestamps
    end

    add_index :categorias, [:nome, :sexo, :idade], unique: true
  end

  def down
    drop_table :categorias if table_exists?(:categorias)
  end
end
