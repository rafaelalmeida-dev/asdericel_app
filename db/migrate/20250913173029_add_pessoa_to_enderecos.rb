# frozen_string_literal: true

class AddPessoaToEnderecos < ActiveRecord::Migration[7.2]
  def up
    add_reference :enderecos, :pessoa, null: false, foreign_key: true
  end

  def down
    remove_reference :enderecos, :pessoa, foreign_key: true
  end
end
