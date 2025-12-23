# frozen_string_literal: true

class CreateEstadocivils < ActiveRecord::Migration[7.2]
  def up
    # unless table_exists?(:estadocivils)
    #   create_table :estadocivils do |t|
    #     t.string :nome
    #     t.string :created_by
    #     t.string :updated_by
    #     t.datetime :deleted_at
    #     t.timestamps
    #   end
    # end
  end

  def down
    if foreign_key_exists?(:pessoas, :estadocivils)
      remove_foreign_key :pessoas, :estadocivils
    end

    drop_table :estadocivils if table_exists?(:estadocivils)
  end
end
