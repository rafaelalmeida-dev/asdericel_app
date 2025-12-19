# frozen_string_literal: true

class RemoveSexoEquipes < ActiveRecord::Migration[7.2]
  def up
    # Remove a foreign key e a coluna sexo_id da tabela equipes
    if foreign_key_exists?(:equipes, :sexos)
      remove_foreign_key :equipes, :sexos
    end

    if column_exists?(:equipes, :sexo_id)
      remove_column :equipes, :sexo_id
    end
  end

  def down
    # Reverte as mudanças caso necessário
    unless column_exists?(:equipes, :sexo_id)
      add_reference :equipes, :sexo, foreign_key: true
    end
  end
end
