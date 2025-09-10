# frozen_string_literal: true

class CreateEnderecos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:enderecos)
      create_table :enderecos do |t|
        t.string :cep
        t.string :logradouro
        t.string :bairro
        t.string :localidade
        t.string :uf
        t.string :pais
        t.string :numero
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
