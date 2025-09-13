# frozen_string_literal: true

class CreatePessoas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:pessoas)
      create_table :pessoas do |t|
        t.string :nome
        t.string :cpf
        t.string :rg
        t.string :sexo
        t.string :telefone
        t.string :email
        t.date :data_nascimento
        t.references :endereco, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :pessoas if table_exists?(:pessoas)
  end
end
