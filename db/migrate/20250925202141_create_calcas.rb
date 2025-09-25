# frozen_string_literal: true

class CreateCalcas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:calcas)
      create_table :calcas do |t|
        t.string :numero
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :calcas if table_exists?(:calcas)
  end
end
