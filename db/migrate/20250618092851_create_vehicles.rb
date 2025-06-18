class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :vehicle_type
      t.string :model
      t.string :licence_plate
      t.string :capacity

      t.timestamps
    end
  end
end
