# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_27_082313) do
  create_table "album_pictures", force: :cascade do |t|
    t.text "picture", null: false
    t.integer "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.boolean "is_public", default: true
    t.datetime "day_of_publish"
    t.integer "no_picture", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_albums", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_photos", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "photo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.boolean "is_public", default: true
    t.datetime "day_of_publish"
    t.text "photo", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "email", null: false
    t.string "pass", null: false
    t.text "avatar"
    t.integer "no_photo", default: 0
    t.integer "no_album", default: 0
    t.datetime "last_log_in"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "album_pictures", "albums"
  add_foreign_key "albums", "users"
  add_foreign_key "follows", "users", column: "followee_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "photos", "users"
end
