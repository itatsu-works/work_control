class RemoveGroupIdFromWork < ActiveRecord::Migration[6.0]
  def change
    remove_column :works, :group_id, :references
  end
end
