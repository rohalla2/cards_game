# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140324232748) do

  create_table "available_cards", force: true do |t|
    t.integer  "card_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "available_cards", ["card_id"], name: "index_available_cards_on_card_id"
  add_index "available_cards", ["game_id"], name: "index_available_cards_on_game_id"

  create_table "cards", force: true do |t|
    t.string   "cardtype"
    t.string   "text"
    t.integer  "numAnswers"
    t.string   "expansion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game"
  end

  create_table "cards_players", force: true do |t|
    t.integer  "card_id"
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards_players", ["card_id"], name: "index_cards_players_on_card_id"
  add_index "cards_players", ["player_id"], name: "index_cards_players_on_player_id"

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "code"
    t.integer  "creator_id"
    t.boolean  "closed"
    t.string   "game_status"
    t.string   "player_choosing"
  end

  create_table "games_players", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_hands", force: true do |t|
    t.integer "player_id"
    t.integer "card_id"
    t.integer "game_id"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
