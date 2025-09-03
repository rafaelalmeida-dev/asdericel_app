class CreateEventos < ActiveRecord::Migration[7.2]
  def change
    create_table :eventos do |t|
      t.string :nome
      t.string :edicao
      t.string :categoria
      t.string :municipio
      t.string :estado
      t.string :pais

      t.timestamps
    end
  end
end
