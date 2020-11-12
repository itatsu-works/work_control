class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer        :leader,      null: false
      t.string         :group_name,  null: false
      t.timestamps
    end
  end
end
