# frozen_string_literal: true

class CreateAssociados < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:associados)
      create_table :associados do |t|
        t.string :nome
        t.string :nome_social
        t.string :nome_conhecido
        t.string :mae
        t.string :pai
        t.date :data_nascimento
        t.integer :sexo
        t.string :cpf
        t.string :rg
        t.string :orgao_emissor
        t.date :data_expedicao
        t.string :passaporte
        t.integer :estado_civil
        t.string :profissao
        t.integer :ensino
        t.string :celular
        t.string :email
        t.string :instagram
        t.string :observacao
        t.integer :tipo_cadastro
        t.references :endereco, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :associados if table_exists?(:associados)
  end
end
