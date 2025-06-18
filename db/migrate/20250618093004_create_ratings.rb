class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rateable, polymorphic: true, null: false
      t.integer :stars
      t.string :comments

      t.timestamps
    end
  end
end
