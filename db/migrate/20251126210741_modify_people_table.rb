class ModifyPeopleTable < ActiveRecord::Migration[8.1]
  def change
    remove_column :people, :created_at
    remove_column :people, :updated_at
  end
end
