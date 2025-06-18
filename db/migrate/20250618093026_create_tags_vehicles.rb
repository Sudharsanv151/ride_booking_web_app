class CreateTagsVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :tags_vehicles do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
