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

ActiveRecord::Schema.define(version: 2020_12_03_072628) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "dancer_id", null: false
    t.integer "dance_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dance_class_id"], name: "index_comments_on_dance_class_id"
    t.index ["dancer_id"], name: "index_comments_on_dancer_id"
  end

  create_table "dance_classes", force: :cascade do |t|
    t.string "type"
    t.string "description"
    t.integer "category_id", null: false
    t.integer "dancer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_dance_classes_on_category_id"
    t.index ["dancer_id"], name: "index_dance_classes_on_dancer_id"
  end

  create_table "dancers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "dance_classes"
  add_foreign_key "comments", "dancers"
  add_foreign_key "dance_classes", "categories"
  add_foreign_key "dance_classes", "dancers"
end
