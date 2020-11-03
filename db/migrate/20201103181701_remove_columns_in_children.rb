class RemoveColumnsInChildren < ActiveRecord::Migration
  def change
    remove_column :children, :milestone_id, :integer
    remove_column :children, :appointment_id, :integer
  end
end
