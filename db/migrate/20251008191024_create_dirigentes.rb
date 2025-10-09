# frozen_string_literal: true

class CreateDirigentes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:dirigentes)
      create_table :dirigentes do |t|
        t.string :cref
        t.references :pessoa, foreign_key: true
        t.references :modalidade, foreign_key: true
        t.references :federacao, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :dirigentes if table_exists?(:dirigentes)
  end
end
