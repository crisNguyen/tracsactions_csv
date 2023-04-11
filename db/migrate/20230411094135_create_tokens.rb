class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :name
      t.string :symbol
      t.string :coin_name
      t.string :full_name
      t.timestamps
    end
  end
end
