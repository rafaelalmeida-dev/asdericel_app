# frozen_string_literal: true

class CreateAtletaFederacaos < ActiveRecord::Migration[7.2]
  def up
    # unless table_exists?(:atleta_federacaos)
    #   create_table :atleta_federacaos do |t|
    #     t.string :numero
    #     t.references :atleta, foreign_key: true
    #     t.references :federacao, foreign_key: true
    #     t.string :created_by
    #     t.string :updated_by
    #     t.datetime :deleted_at
    #     t.timestamps
    #   end
    # end
  end

  def down
    drop_table :atleta_federacaos if table_exists?(:atleta_federacaos)
  end
end
