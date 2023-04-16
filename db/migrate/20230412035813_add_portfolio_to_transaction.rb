class AddPortfolioToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :portfolio, :decimal
  end
end
