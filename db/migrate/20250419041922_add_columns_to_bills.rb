class AddColumnsToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :rent, :integer, null: false, default: 0
    add_column :bills, :electricity_unit_price, :integer, null: false, default: 0
    add_column :bills, :water_unit_price, :integer, null: false, default: 0
    add_column :bills, :surcharge_per_person, :integer, null: false, default: 0
  end
end
