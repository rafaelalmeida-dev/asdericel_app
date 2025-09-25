# frozen_string_literal: true

class CreateCategoria < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:categoria)
      create_table :categoria do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :categoria if table_exists?(:categoria)
  end
end
