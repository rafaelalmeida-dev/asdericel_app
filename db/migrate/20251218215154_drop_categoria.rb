# frozen_string_literal: true

class DropCategoria < ActiveRecord::Migration[7.2]
  def up
    if foreign_key_exists?(:equipes, :categoria)
      remove_foreign_key :equipes, :categoria
    end

    drop_table :categoria if table_exists?(:categoria)
  end

  def down
    return if table_exists?(:categoria)

    create_table :categoria do |t|
      t.string :nome
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end

    add_foreign_key :equipes, :categoria
  end
end
