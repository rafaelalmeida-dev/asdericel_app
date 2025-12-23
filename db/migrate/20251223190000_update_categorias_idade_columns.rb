class UpdateCategoriasIdadeColumns < ActiveRecord::Migration[7.2]
  def change
    remove_column :categorias, :idade, :integer
    add_column :categorias, :idade_minima, :integer, null: false, default: 0
    add_column :categorias, :idade_maxima, :integer, null: false, default: 0
  end
end
