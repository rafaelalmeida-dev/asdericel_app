# frozen_string_literal: true

class CreateAtletas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:atletas)
      create_table :atletas do |t|
        t.string :numeroSus
        t.string :peso
        t.string :altura
        t.references :pessoa, foreign_key: true
        t.references :camisa, foreign_key: true
        t.references :calca, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :atletas if table_exists?(:atletas)
  end
end
