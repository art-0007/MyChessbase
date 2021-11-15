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

ActiveRecord::Schema.define(version: 2021_11_15_053331) do

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index "\"user_id\", \"puzzle_id\"", name: "index_articles_on_user_id_and_puzzle_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "puzzle_categories", force: :cascade do |t|
    t.integer "puzzle_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_puzzle_categories_on_category_id"
    t.index ["puzzle_id"], name: "index_puzzle_categories_on_puzzle_id"
  end

  create_table "puzzle_tags", force: :cascade do |t|
    t.integer "puzzle_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_id", "tag_id"], name: "index_puzzle_tags_on_puzzle_id_and_tag_id", unique: true
    t.index ["puzzle_id"], name: "index_puzzle_tags_on_puzzle_id"
    t.index ["tag_id"], name: "index_puzzle_tags_on_tag_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.string "solution", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index "\"user_id\", \"puzzle_id\"", name: "index_puzzles_on_user_id_and_puzzle_id"
    t.index ["user_id"], name: "index_puzzles_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "body"
    t.boolean "solved", default: false
    t.integer "user_id", null: false
    t.integer "puzzle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_id"], name: "index_solutions_on_puzzle_id"
    t.index ["user_id", "puzzle_id", "solved"], name: "index_solutions_on_user_id_and_puzzle_id_and_solved", unique: true
    t.index ["user_id", "puzzle_id"], name: "index_solutions_on_user_id_and_puzzle_id", unique: true
    t.index ["user_id"], name: "index_solutions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.string "remember_token_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "articles", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "puzzle_categories", "categories"
  add_foreign_key "puzzle_categories", "puzzles"
  add_foreign_key "puzzle_tags", "puzzles"
  add_foreign_key "puzzle_tags", "tags"
  add_foreign_key "puzzles", "users"
  add_foreign_key "solutions", "puzzles"
  add_foreign_key "solutions", "users"
end
