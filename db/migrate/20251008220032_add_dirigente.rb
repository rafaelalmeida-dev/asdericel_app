# frozen_string_literal: true

class AddDirigente < ActiveRecord::Migration[7.2]
  def up
      add_reference :dirigentes, :ensino, null: true, foreign_key: true
      add_reference :dirigentes, :camisa, null: true, foreign_key: true
      add_reference :dirigentes, :calca, null: true, foreign_key: true
      add_column :dirigentes, :peso, :string
      add_column :dirigentes, :altura, :string
      add_column :dirigentes, :numeroSus, :string
      add_column :dirigentes, :profissao, :string
      add_column :dirigentes, :celular, :string
      add_column :dirigentes, :instagram, :string
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
