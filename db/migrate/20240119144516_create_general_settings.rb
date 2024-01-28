class CreateGeneralSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :general_settings do |t|
      t.integer :rent, null: false, default: 0
      t.integer :electricity_price, null: false, default: 0
      t.integer :water_price, null: false, default: 0
      t.integer :surcharge, null: false, default: 0
      t.string :room_name
      t.text :description

      t.timestamps
    end
  end
end
