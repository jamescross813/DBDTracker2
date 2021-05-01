class CreateUserSurvivorPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_survivor_perks do |t|
      t.integer :user_id
      t.integer :survivor_id
      t.integer :perk_id
    end
  end
end
