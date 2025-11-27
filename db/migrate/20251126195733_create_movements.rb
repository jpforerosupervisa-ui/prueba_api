class CreateMovements < ActiveRecord::Migration[8.1]
  def change
    create_table :movements do |t|
      t.references :authorization, null: false, foreign_key: true
      t.string :create_time, null: false
      t.integer :way, null: false
      t.string :vehicle_plate, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
