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

ActiveRecord::Schema.define(version: 2021_08_28_105218) do

  create_table "categories", force: :cascade do |t|
    t.text "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "order_id"
    t.integer "question_user_id"
    t.integer "answer_user_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.text "detail"
    t.date "deadline"
    t.integer "contractor_id"
    t.boolean "order_completion"
    t.integer "order_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "title"
    t.integer "category_id"
    t.text "detail"
    t.integer "contractor_id"
    t.date "deadline"
    t.integer "order_completion"
    t.integer "order_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer "user_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "mail"
    t.text "password"
    t.text "belongs"
    t.integer "my_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
