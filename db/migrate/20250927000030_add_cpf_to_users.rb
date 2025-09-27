# frozen_string_literal: true

class AddCpfToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :cpf, :string, null: false
    add_index :users, :cpf, unique: true
  end
end
