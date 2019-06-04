class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
