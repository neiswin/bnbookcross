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

ActiveRecord::Schema[7.0].define(version: 2023_03_20_081317) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.integer "condition_book", default: 0
    t.integer "status_book", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "place_id"
    t.index ["place_id"], name: "index_books_on_place_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.integer "place_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book_title"
    t.string "book_author"
    t.index ["book_id"], name: "index_interactions_on_book_id"
    t.index ["place_id"], name: "index_interactions_on_place_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "place_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id"
    t.index ["users_id"], name: "index_places_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.integer "role", default: 0, null: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "books", "places"
  add_foreign_key "books", "users"
  add_foreign_key "interactions", "books"
  add_foreign_key "interactions", "places"
  add_foreign_key "interactions", "users"
  add_foreign_key "places", "users", column: "users_id"
end
