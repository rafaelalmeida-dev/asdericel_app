# frozen_string_literal: true

class CreateEstadosCivis < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:estados_civis)
      create_table :estados_civis do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :estados_civis if table_exists?(:estados_civis)
  end
end
