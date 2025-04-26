class CreateSavingsAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :savings_accounts do |t|
      t.date :savings_date
      t.decimal :sacombank_amount, precision: 15, scale: 2, null: false, default: 0
      t.decimal :tpbank_amount, precision: 15, scale: 2, null: false, default: 0
      t.decimal :vietcombank_amount, precision: 15, scale: 2, null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
