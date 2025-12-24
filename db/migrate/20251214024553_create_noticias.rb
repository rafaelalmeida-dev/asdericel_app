# frozen_string_literal: true

class CreateNoticias < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:noticias)
      create_table :noticias do |t|
        t.string :titulo
        t.text :conteudo
        t.string :categoria
        t.string :imagem
        t.date :data_publicacao
        t.boolean :destaque, default: false
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end

      add_index :noticias, :categoria
      add_index :noticias, :destaque
      add_index :noticias, :data_publicacao
    end
  end

  def down
    drop_table :noticias if table_exists?(:noticias)
  end
end
