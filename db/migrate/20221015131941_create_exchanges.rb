class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.string :currency_data

      t.timestamps
    end
  end
end
