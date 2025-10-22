# frozen_string_literal: true

class CreateDirigenteFederacoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:dirigente_federacoes)
      create_table :dirigente_federacoes do |t|
        t.string :numero
        t.references :dirigente, foreign_key: true
        t.references :federacao, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :dirigente_federacoes if table_exists?(:dirigente_federacoes)
  end
end
