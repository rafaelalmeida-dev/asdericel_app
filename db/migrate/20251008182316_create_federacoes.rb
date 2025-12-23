# frozen_string_literal: true

class CreateFederacoes < ActiveRecord::Migration[7.2]
  def up
   unless table_exists?(:federacoes)
      create_table :federacoes do |t|
        t.string :nome
        t.string :sigla
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
   end
  end

  def down
  drop_table :federacoes if table_exists?(:federacoes)  end
end
