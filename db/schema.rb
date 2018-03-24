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

ActiveRecord::Schema.define(version: 20180324185510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "permalink"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "category_id"
    t.index ["article_id"], name: "index_articles_categories_on_article_id"
    t.index ["category_id"], name: "index_articles_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "images", force: :cascade do |t|
    t.string "page"
    t.string "src"
    t.string "alt"
    t.string "imagable_type"
    t.bigint "imagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imagable_type", "imagable_id"], name: "index_images_on_imagable_type_and_imagable_id"
  end

  create_table "meta", force: :cascade do |t|
    t.string "page"
    t.string "title"
    t.string "meta_description"
    t.string "og_title"
    t.string "og_description"
    t.string "og_image"
    t.string "metable_type"
    t.bigint "metable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metable_type", "metable_id"], name: "index_meta_on_metable_type_and_metable_id"
  end

end
