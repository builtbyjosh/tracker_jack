class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :child_id
      t.string :content
      t.datetime :date
      t.timestamps null: false
    end
  end
end
