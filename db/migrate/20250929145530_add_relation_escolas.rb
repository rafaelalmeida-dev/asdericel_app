# frozen_string_literal: true

class AddRelationEscolas < ActiveRecord::Migration[7.2]
  def up
    add_reference :escolas, :municipio, null: true, foreign_key: true
    add_reference :escolas, :estado, null: true, foreign_key: true

    remove_column :escolas, :municipio, :string
    remove_column :escolas, :estado, :string
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
