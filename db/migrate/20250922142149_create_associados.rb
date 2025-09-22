# frozen_string_literal: true

class CreateAssociados < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:associados)
      create_table :associados do |t|
        t.string :celular
        t.string :email
        t.string :instagram
        t.string :observacao
        t.references :pessoa, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :associados if table_exists?(:associados)
  end
end
