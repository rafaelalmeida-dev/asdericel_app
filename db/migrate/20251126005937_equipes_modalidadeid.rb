# frozen_string_literal: true

class EquipesModalidadeid < ActiveRecord::Migration[7.2]
  def up
    add_reference :equipes, :modalidade, null: true, foreign_key: true
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
