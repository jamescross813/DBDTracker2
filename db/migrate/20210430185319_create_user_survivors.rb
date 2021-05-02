class CreateUserSurvivors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_survivors do |t|
      t.integer :user_id
      t.integer :survivor_id
    end
  end
end
