# frozen_string_literal: true

class CreateAtletaEquipes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:atleta_equipes)
      create_table :atleta_equipes do |t|
        t.references :atleta, foreign_key: true
        t.references :equipe, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :atleta_equipes if table_exists?(:atleta_equipes)
  end
end
