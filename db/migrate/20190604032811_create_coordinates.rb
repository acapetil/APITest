class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.integer :attribute_id

      t.timestamps null: false
    end
  end
end
