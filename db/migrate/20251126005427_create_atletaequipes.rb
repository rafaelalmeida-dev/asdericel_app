# frozen_string_literal: true

class CreateAtletaequipes < ActiveRecord::Migration[7.2]
  def up
    # unless table_exists?(:atletaequipes)
    #   create_table :atletaequipes do |t|
    #     t.references :atleta, foreign_key: true
    #     t.references :equipe, foreign_key: true
    #     t.string :created_by
    #     t.string :updated_by
    #     t.datetime :deleted_at
    #     t.timestamps
    #   end
    # end
  end

  def down
    drop_table :atletaequipes if table_exists?(:atletaequipes)
  end
end
