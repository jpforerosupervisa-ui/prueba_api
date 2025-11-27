class ModifyMovements < ActiveRecord::Migration[8.1]
  def change
    remove_column :movements, :created_at
    remove_column :movements, :updated_at
  end
end
