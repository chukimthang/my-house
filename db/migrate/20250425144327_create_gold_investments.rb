class CreateGoldInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :gold_investments do |t|
      t.decimal :number_of_chi, precision: 8, scale: 2, null: false, default: 1
      t.integer :unit_price, null: false, default: 0
      t.date :transaction_date
      t.integer :transaction_type, null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
