# frozen_string_literal: true

class CreatePaises < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:paises)
      create_table :paises do |t|
        t.string :nome
        t.string :sigla
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :paises if table_exists?(:paises)
  end
end
