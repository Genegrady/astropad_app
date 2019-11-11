class CreatePadders < ActiveRecord::Migration[6.0]
  def change
    create_table :padders do |t|
      t.string :username
      t.string :password
      t.string :bio
      t.string :languages
      t.string :zodiac
      t.belongs_to :location, null: false, foreign_key: true
      t.string :countries_visited
      t.boolean :room_available

      t.timestamps
    end
  end
end
