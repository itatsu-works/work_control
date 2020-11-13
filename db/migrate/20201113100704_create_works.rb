class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.references       :group,              null: false,   foreign_key: true
      t.text             :contents,           null: false
      t.time             :deadline,           null: false
      t.string           :work_name,          null: false
      t.timestamps
    end
  end
end
