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

ActiveRecord::Schema[7.1].define(version: 2025_06_03_013836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "poses", force: :cascade do |t|
    t.integer "api_id"
    t.string "name"
    t.string "sanskrit_name"
    t.text "description"
    t.string "pose_benefits"
    t.string "category"
    t.string "difficulty"
    t.string "translation_name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routine_poses", force: :cascade do |t|
    t.bigint "routine_id", null: false
    t.bigint "pose_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pose_id"], name: "index_routine_poses_on_pose_id"
    t.index ["routine_id"], name: "index_routine_poses_on_routine_id"
  end

  create_table "routines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "routine_poses", "poses"
  add_foreign_key "routine_poses", "routines"
end
