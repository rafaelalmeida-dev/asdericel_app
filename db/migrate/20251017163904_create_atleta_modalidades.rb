# frozen_string_literal: true

class CreateAtletaModalidades < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:atleta_modalidades)
      create_table :atleta_modalidades do |t|
        t.references :atleta, foreign_key: true
        t.references :modalidade, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :atleta_modalidades if table_exists?(:atleta_modalidades)
  end
end
