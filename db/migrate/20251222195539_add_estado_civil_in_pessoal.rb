# frozen_string_literal: true

class AddEstadoCivilInPessoal < ActiveRecord::Migration[7.2]
  def up
    # Remove FK antiga, se existir
    if foreign_key_exists?(:pessoas, :estados_civis)
      remove_foreign_key :pessoas, :estados_civis
    end

    # Remove coluna antiga, se existir
    if column_exists?(:pessoas, :estadocivil_id)
      remove_column :pessoas, :estadocivil_id
    end

    # Adiciona a referência correta com FK
    add_reference :pessoas, :estado_civil, foreign_key: { to_table: :estados_civis }
  end

  def down
    # Remove FK criada
    if foreign_key_exists?(:pessoas, :estados_civis)
      remove_foreign_key :pessoas, :estados_civis
    end

    # Remove a coluna criada pelo add_reference
    if column_exists?(:pessoas, :estado_civil_id)
      remove_column :pessoas, :estado_civil_id
    end

    # Recria a coluna antiga (estado anterior)
    add_column :pessoas, :estadocivil_id, :bigint
  end
end
