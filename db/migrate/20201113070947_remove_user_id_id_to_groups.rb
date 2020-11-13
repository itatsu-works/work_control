class RemoveUserIdIdToGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :user_id_id, :references
  end
end
