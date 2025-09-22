# frozen_string_literal: true

class CreateEnsinos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:ensinos)
      create_table :ensinos do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :ensinos if table_exists?(:ensinos)
  end
end
