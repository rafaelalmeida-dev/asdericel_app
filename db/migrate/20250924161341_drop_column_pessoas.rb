# frozen_string_literal: true

class DropColumnPessoas < ActiveRecord::Migration[7.2]
  def change
    remove_column :pessoas, :ensino_id, :integer
    remove_column :pessoas, :profissao, :string
  end
end
