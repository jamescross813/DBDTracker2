class CreateKillers < ActiveRecord::Migration[5.2]
  def change
    create_table :killers do |t|
      t.string :name
      t.string :realm
      t.string :power
      t.string :weapon
      t.string :speed
      t.string :terror_radius
      t.string :height
      t.string :difficulty
      t.text :overview
      t.text :lore
      t.string :dlc
    end
  end
end
