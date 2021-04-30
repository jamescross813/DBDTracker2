class CreateUserKillers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_killers do |t|
      t.integer :user_id
      t.integer :killer_id
    end
  end
end
