class ModifyAuthorization < ActiveRecord::Migration[8.1]
  def change
    remove_column :authorizations, :created_at
    remove_column :authorizations, :updated_at
  end
end
