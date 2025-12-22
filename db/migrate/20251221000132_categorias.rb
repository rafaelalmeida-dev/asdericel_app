# frozen_string_literal: true

class Categorias < ActiveRecord::Migration[7.2]
  def up
    # Adicione aqui o código para "migrar" (criar ou alterar tabelas/colunas)
    add_column :categorias, :created_by, :string
    add_column :categorias, :updated_by, :string
    add_column :categorias, :deleted_at, :datetime
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
