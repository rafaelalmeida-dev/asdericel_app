# frozen_string_literal: true

class AddReferencesEndereco < ActiveRecord::Migration[7.2]
  def up
      add_reference :associados, :endereco, null: true, foreign_key: true
      add_reference :atletas, :endereco, null: true, foreign_key: true
      add_reference :dirigentes, :endereco, null: true, foreign_key: true
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
