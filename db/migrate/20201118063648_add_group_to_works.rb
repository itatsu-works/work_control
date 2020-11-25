class AddGroupToWorks < ActiveRecord::Migration[6.0]
  def change
    add_reference :works, :group, null: false, foreign_key: true
  end
end
