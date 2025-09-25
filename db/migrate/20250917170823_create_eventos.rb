# frozen_string_literal: true

class CreateEventos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:eventos)
      create_table :eventos do |t|
        t.string :nome
        t.string :edicacao
        t.string :promotor
        t.string :local
        t.datetime :datainicio
        t.datetime :datafim
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :eventos if table_exists?(:eventos)
  end
end
