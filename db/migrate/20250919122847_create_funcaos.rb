# frozen_string_literal: true

class CreateFuncaos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:funcaos)
      create_table :funcaos do |t|
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :funcaos if table_exists?(:funcaos)
  end
end
