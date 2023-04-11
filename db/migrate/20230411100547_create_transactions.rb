class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :currency, index: true, foreign_key: true
      t.references :token, index: true, foreign_key: true
      t.integer :type
      t.float :amount
      t.decimal :portfolio, precision: 10, scale: 2
      t.timestamps
    end
  end
end
