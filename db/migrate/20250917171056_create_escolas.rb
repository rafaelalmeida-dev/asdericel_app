# frozen_string_literal: true

class CreateEscolas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:escolas)
      create_table :escolas do |t|
        t.string :nome
        t.string :inep
        t.string :telefone
        t.string :municipio
        t.string :estado
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :escolas if table_exists?(:escolas)
  end
end
