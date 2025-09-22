# frozen_string_literal: true

class CreatePessoas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:pessoas)
      create_table :pessoas do |t|
        t.string :nome
        t.string :nomesocial
        t.string :nomeconhecido
        t.string :pai
        t.string :mae
        t.date :datanascimento
        t.string :cpf
        t.integer :cinrg
        t.string :orgaoemissor
        t.date :dataexpedicao
        t.string :passaporte
        t.string :profissao
        t.references :sexo, foreign_key: true
        t.references :estadocivil, foreign_key: true
        t.references :ensino, foreign_key: true
        t.references :funcao, foreign_key: true
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
