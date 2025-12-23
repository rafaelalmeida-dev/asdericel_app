# frozen_string_literal: true

class DropTableDuplicadas < ActiveRecord::Migration[7.2]
  def up
    drop_table :atleta_federacaos if table_exists?(:atleta_federacaos)
    drop_table :federacaos if table_exists?(:federacaos)
    drop_table :noticia if table_exists?(:noticia)
  end
end
