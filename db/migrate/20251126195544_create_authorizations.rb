class CreateAuthorizations < ActiveRecord::Migration[8.1]
  def change
    create_table :authorizations do |t|
      t.references :person, null: false, foreign_key: true
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.string :company_origin, null: true

      t.timestamps
    end
  end
end
