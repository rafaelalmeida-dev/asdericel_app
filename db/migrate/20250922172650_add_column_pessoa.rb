# frozen_string_literal: true

class AddColumnPessoa < ActiveRecord::Migration[7.2]
    def change
    add_column :pessoas, :nomeconhecido, :string
    add_column :pessoas, :pai, :string
    add_column :pessoas, :mae, :string

    # se já existe a coluna rg, renomeia para cinrg
    if column_exists?(:pessoas, :rg)
      rename_column :pessoas, :rg, :cinrg
      change_column :pessoas, :cinrg, :integer
    else
      add_column :pessoas, :cinrg, :integer
    end

    add_column :pessoas, :orgaoemissor, :string
    add_column :pessoas, :dataexpedicao, :date
    add_column :pessoas, :passaporte, :string
    add_column :pessoas, :profissao, :string
  end
end
