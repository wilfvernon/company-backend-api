# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_22_190535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "account_id"
    t.string "profile_image"
    t.string "server"
    t.boolean "primary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "api_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "server"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "api_id"
  end

  create_table "community_characters", force: :cascade do |t|
    t.integer "community_id"
    t.integer "character_id"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "content_events", force: :cascade do |t|
    t.integer "content_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "image"
    t.integer "minimum_level"
    t.integer "minimum_ilevel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "api_id"
  end

  create_table "event_characters", force: :cascade do |t|
    t.integer "character_id"
    t.integer "event_id"
    t.boolean "organiser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_posts", force: :cascade do |t|
    t.integer "character_id"
    t.integer "event_thread_id"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_threads", force: :cascade do |t|
    t.integer "character_id"
    t.integer "event_id"
    t.string "title"
    t.string "flair"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.string "location"
    t.integer "community_id"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "loops", force: :cascade do |t|
    t.string "name"
    t.integer "beats_per_bar"
    t.integer "bars"
    t.integer "BPM"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "loop_id"
    t.integer "cID"
    t.integer "note_key"
    t.integer "velocity"
    t.integer "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "beat_index"
    t.float "delay"
    t.integer "recording_id"
    t.integer "beat_index_off"
  end

  create_table "recordings", force: :cascade do |t|
  end

end
