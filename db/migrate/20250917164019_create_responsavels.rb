# frozen_string_literal: true

class CreateResponsavels < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:responsavels)
      create_table :responsavels do |t|
        t.string :nome
        t.string :rg
        t.string :cpf
        t.string :telefone
        t.string :email
        t.references :parentesco, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :responsavels if table_exists?(:responsavels)
  end
end
