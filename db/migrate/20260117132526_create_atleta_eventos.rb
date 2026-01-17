# frozen_string_literal: true

class CreateAtletaEventos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:atleta_eventos)
      create_table :atleta_eventos do |t|
        t.references :atleta, foreign_key: true
        t.references :evento, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :atleta_eventos if table_exists?(:atleta_eventos)
  end
end
