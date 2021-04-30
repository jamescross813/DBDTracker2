class CreateKillerPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :killer_perks do |t|
      t.integer :perk_id
      t.integer :killer_id
    end
  end
end
