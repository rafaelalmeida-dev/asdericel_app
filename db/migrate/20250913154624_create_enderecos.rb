# frozen_string_literal: true

class CreateEnderecos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:enderecos)
      create_table :enderecos do |t|
        t.string :cep
        t.string :bairro
        t.integer :numero
        t.references :cidade, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :enderecos if table_exists?(:enderecos)
  end
end
