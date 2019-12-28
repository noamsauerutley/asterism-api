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

ActiveRecord::Schema.define(version: 2019_12_11_164308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearance_notes", force: :cascade do |t|
    t.bigint "appearance_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appearance_id"], name: "index_appearance_notes_on_appearance_id"
  end

  create_table "appearances", force: :cascade do |t|
    t.bigint "scene_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_appearances_on_character_id"
    t.index ["scene_id"], name: "index_appearances_on_scene_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "image_url"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "character_notes", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_notes_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_characters_on_story_id"
  end

  create_table "fragment_notes", force: :cascade do |t|
    t.bigint "fragment_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fragment_id"], name: "index_fragment_notes_on_fragment_id"
  end

  create_table "fragments", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.text "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_fragments_on_author_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.text "image_url"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_images_on_character_id"
  end

  create_table "plot_notes", force: :cascade do |t|
    t.bigint "plot_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plot_id"], name: "index_plot_notes_on_plot_id"
  end

  create_table "plots", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.string "name"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_plots_on_story_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.bigint "plot_id", null: false
    t.string "name"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plot_id"], name: "index_scenes_on_plot_id"
  end

  create_table "stories", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "title"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_stories_on_author_id"
  end

  add_foreign_key "appearance_notes", "appearances"
  add_foreign_key "appearances", "characters"
  add_foreign_key "appearances", "scenes"
  add_foreign_key "character_notes", "characters"
  add_foreign_key "characters", "stories"
  add_foreign_key "fragment_notes", "fragments"
  add_foreign_key "fragments", "authors"
  add_foreign_key "images", "characters"
  add_foreign_key "plot_notes", "plots"
  add_foreign_key "plots", "stories"
  add_foreign_key "scenes", "plots"
  add_foreign_key "stories", "authors"
end
