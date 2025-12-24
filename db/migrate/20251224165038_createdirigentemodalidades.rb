# frozen_string_literal: true

class Createdirigentemodalidades < ActiveRecord::Migration[7.2]
  def up
  create_table :dirigente_modalidades do |t|
      t.references :dirigente, null: false, foreign_key: true
      t.references :modalidade, null: false, foreign_key: true
      t.timestamps
    end

    remove_column :dirigentes, :modalidade_id, :integer 
 end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
