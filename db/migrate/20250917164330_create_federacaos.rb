# frozen_string_literal: true

class CreateFederacaos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:federacaos)
      create_table :federacaos do |t|
        t.string :sigla
        t.string :nome
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :federacaos if table_exists?(:federacaos)
  end
end
