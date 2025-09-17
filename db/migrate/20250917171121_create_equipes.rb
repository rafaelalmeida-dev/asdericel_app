# frozen_string_literal: true

class CreateEquipes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:equipes)
      create_table :equipes do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :equipes if table_exists?(:equipes)
  end
end
