class AddProgressToworks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :progress, :integer
  end
end
