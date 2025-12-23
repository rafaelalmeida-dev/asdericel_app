# frozen_string_literal: true

class RemoveFuncao < ActiveRecord::Migration[7.2]
  def up
    # Remove a foreign key e a coluna funcao_id da tabela pessoas
    if foreign_key_exists?(:pessoas, :funcaos)
      remove_foreign_key :pessoas, :funcaos
    end

    if column_exists?(:pessoas, :funcao_id)
      remove_column :pessoas, :funcao_id
    end
  end

  def down
    # Reverte as mudanças caso necessário
    unless column_exists?(:pessoas, :funcao_id)
      add_reference :pessoas, :funcao, foreign_key: true
    end
  end
end
