class CreateUserKillerPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_killer_perks do |t|
      t.integer :user_id
      t.integer :killer_id
      t.integer :perk_id
    end
  end
end