class ChangeDataDeadlineToWorks < ActiveRecord::Migration[6.0]
  def change
    change_column :works, :deadline, :date
  end
end
