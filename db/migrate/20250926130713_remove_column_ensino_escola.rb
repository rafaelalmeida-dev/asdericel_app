# frozen_string_literal: true

class RemoveColumnEnsinoEscola < ActiveRecord::Migration[7.2]
  def up
    remove_column :atletas, :ensino_id, :integer
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
