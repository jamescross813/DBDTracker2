class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :currency_name
      t.integer :amount
      t.integer :user_id
    end
  end
end
