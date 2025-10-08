# frozen_string_literal: true

class AddEscolaAtletas < ActiveRecord::Migration[7.2]
  def up
        add_reference :atletas, :escola, null: true, foreign_key: true

  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
