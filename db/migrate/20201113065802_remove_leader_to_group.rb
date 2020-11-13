class RemoveLeaderToGroup < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :leader, :integer
  end
end
