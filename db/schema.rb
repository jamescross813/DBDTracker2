# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_30_185336) do

  create_table "currencies", force: :cascade do |t|
    t.string "currency_name"
    t.integer "amount"
    t.integer "user_id"
  end

  create_table "killer_perks", force: :cascade do |t|
    t.integer "perk_id"
    t.integer "killer_id"
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

  create_table "survivor_perks", force: :cascade do |t|
    t.integer "perk_id"
    t.integer "survivor_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "overview"
    t.text "lore"
    t.text "difficulty"
    t.string "dlc"
  end

  create_table "user_killers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "killer_id"
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
