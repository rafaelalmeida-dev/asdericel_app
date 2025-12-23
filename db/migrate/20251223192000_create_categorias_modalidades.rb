class CreateCategoriasModalidades < ActiveRecord::Migration[7.2]
  def change
    create_table :categorias_modalidades do |t|
      t.references :categoria, null: false, foreign_key: true
      t.references :modalidade, null: false, foreign_key: true
      t.timestamps
    end
    # Remover a coluna modalidade_id da tabela categorias, se já existir
    if column_exists?(:categorias, :modalidade_id)
      remove_reference :categorias, :modalidade, foreign_key: true
    end
  end
end
