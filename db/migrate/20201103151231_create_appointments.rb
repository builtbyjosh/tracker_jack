class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :child_id
      t.date :date
      t.time :time
      t.string :doctor
      t.timestamps null: false
    end
  end
end
