class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.integer :electricity_quantity, null: false, default: 0
      t.integer :water_quantity, null: false, default: 0
      t.integer :electricity_cost, null: false, default: 0
      t.integer :water_cost, null: false, default: 0
      t.integer :surcharge_fee, null: false, default: 1
      t.integer :total_amount, null: false, default: 0
      t.references :meter, null: false

      t.timestamps
    end
  end
end
