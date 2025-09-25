# frozen_string_literal: true

class CreateCamisas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:camisas)
      create_table :camisas do |t|
        t.string :numero
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :camisas if table_exists?(:camisas)
  end
end
