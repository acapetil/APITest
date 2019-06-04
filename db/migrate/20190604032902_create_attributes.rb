class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :external_id
      t.decimal :magnitude
      t.string :time
      t.string :mag_type
      t.string :external_url
      t.integer :feature_id

      t.timestamps null: false
    end
  end
end
