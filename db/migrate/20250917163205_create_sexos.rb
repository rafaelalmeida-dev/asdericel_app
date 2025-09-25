# frozen_string_literal: true

class CreateSexos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:sexos)
      create_table :sexos do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :sexos if table_exists?(:sexos)
  end
end
