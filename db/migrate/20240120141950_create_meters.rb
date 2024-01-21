class CreateMeters < ActiveRecord::Migration[7.0]
  def change
    create_table :meters do |t|
      t.date :month_used, null: false
      t.integer :electricity_index, null: false, default: 0
      t.integer :water_index, null: false, default: 0

      t.timestamps
    end
  end
end
