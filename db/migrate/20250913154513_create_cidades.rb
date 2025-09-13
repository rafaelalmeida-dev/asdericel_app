# frozen_string_literal: true

class CreateCidades < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:cidades)
      create_table :cidades do |t|
        t.string :nome
        t.string :sigla
        t.references :estado, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :cidades if table_exists?(:cidades)
  end
end
