# frozen_string_literal: true

class CreateParentescos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:parentescos)
      create_table :parentescos do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :parentescos if table_exists?(:parentescos)
  end
end
