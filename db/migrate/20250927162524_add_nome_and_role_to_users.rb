# frozen_string_literal: true

class AddNomeAndRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :nome, :string, null: false
    add_reference :users, :role, null: false, foreign_key: true
  end
end
