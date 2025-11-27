class RenamePrimaryKeys < ActiveRecord::Migration[8.1]
  def change
    rename_column :authorizations, :id, :authorization_id
    rename_column :movements, :id, :movement_id
  end
end
