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

ActiveRecord::Schema[7.0].define(version: 2024_02_26_104547) do
  create_table "addresses", force: :cascade do |t|
    t.string "street1"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "pod_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pod_id"], name: "index_addresses_on_pod_id"
  end

  create_table "applications", force: :cascade do |t|
    t.integer "parent_id", null: false
    t.integer "pod_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_applications_on_parent_id"
    t.index ["pod_id"], name: "index_applications_on_pod_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.integer "grade"
    t.integer "parent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image_url"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pods", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.integer "grade"
    t.string "status"
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_pods_on_teacher_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "pod_id", null: false
    t.integer "parent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_reviews_on_parent_id"
    t.index ["pod_id"], name: "index_reviews_on_pod_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "pods"
  add_foreign_key "applications", "parents"
  add_foreign_key "applications", "pods"
  add_foreign_key "children", "parents"
  add_foreign_key "pods", "teachers"
  add_foreign_key "reviews", "parents"
  add_foreign_key "reviews", "pods"
end
