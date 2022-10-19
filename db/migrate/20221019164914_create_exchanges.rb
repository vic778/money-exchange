class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.string :from
      t.string :to
      t.float :amount
      t.float :amount_converted

      t.timestamps
    end
  end
end
