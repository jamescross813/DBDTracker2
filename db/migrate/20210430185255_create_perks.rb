class CreatePerks < ActiveRecord::Migration[5.2]
  def change
    create_table :perks do |t|
      t.string :perk_name
      t.text :description
      t.integer :teach_level
      t.string :role
      t.string :name
    end
  end
end
