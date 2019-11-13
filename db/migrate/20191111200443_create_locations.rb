class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :languages
      t.integer :padder_id
      

      t.timestamps
    end
  end
end
