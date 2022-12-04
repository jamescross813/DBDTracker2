class CreateUserCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_currencies do |t|
      t.integer :user_id
      t.string :currency_name
      t.integer :amount
    end
  end
end
