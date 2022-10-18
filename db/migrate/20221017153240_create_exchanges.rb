class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.integer :amount
      t.string :from
      t.string :to
      t.integer :amount_converted
      t.date :date

      t.timestamps
    end
  end
end
