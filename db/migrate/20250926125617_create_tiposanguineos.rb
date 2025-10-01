# frozen_string_literal: true

class CreateTiposanguineos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:tiposanguineos)
      create_table :tiposanguineos do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :tiposanguineos if table_exists?(:tiposanguineos)
  end
end
