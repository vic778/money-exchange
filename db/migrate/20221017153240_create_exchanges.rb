class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.integer :amount
      t.string :currrency
      t.integer :amount_to_calculate

      t.timestamps
    end
  end
end
