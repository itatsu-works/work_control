class RemoveUserIdIdToGroups < ActiveRecord::Migration[6.0]
  def up
    remove_column :groups, :user_id_id
  end
  
  def down
    add_column :groups, :user_id_id, :references
  end
end
