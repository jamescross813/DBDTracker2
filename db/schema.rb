ActiveRecord::Schema.define(version: 2021_05_01_073910) do

  create_table "currencies", force: :cascade do |t|
    t.string "currency_name"
    t.integer "amount"
    t.integer "user_id"
  end

  create_table "killers", force: :cascade do |t|
    t.string "name"
    t.string "realm"
    t.string "power"
    t.string "weapon"
    t.string "speed"
    t.string "terror_radius"
    t.string "height"
    t.string "difficulty"
    t.text "overview"
    t.text "lore"
    t.string "dlc"
  end

  create_table "perks", force: :cascade do |t|
    t.string "perk_name"
    t.text "description"
    t.integer "teach_level"
    t.string "role"
    t.string "name"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "overview"
    t.text "lore"
    t.text "difficulty"
    t.string "dlc"
  end

  create_table "user_killer_perks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "killer_id"
    t.integer "perk_id"
  end

  create_table "user_killers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "killer_id"
  end

  create_table "user_survivor_perks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "survivor_id"
    t.integer "perk_id"
  end

  create_table "user_survivors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "survivor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
