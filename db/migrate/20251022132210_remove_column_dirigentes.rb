# frozen_string_literal: true

class RemoveColumnDirigentes < ActiveRecord::Migration[7.2]
  def up
    remove_column :dirigentes, :federacao_id, :integer
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
