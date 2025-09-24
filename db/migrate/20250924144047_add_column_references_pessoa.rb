# frozen_string_literal: true

class AddColumnReferencesPessoa < ActiveRecord::Migration[7.2]
  def up
            add_reference :pessoas, :sexo, null: true, foreign_key: true
            add_reference :pessoas, :estadocivil, null: true, foreign_key: true
            add_column :pessoas, :nomesocial, :string
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
