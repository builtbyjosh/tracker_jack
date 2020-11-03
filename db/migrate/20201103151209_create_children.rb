class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.datetime :dob
      t.integer :parent_id
      t.integer :milestone_id
      t.integer :appointment_id
      t.timestamps null: false
    end
  end
end
