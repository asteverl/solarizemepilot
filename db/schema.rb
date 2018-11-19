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

ActiveRecord::Schema.define(version: 2018_08_29_153526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.bigint "project_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_images_on_project_id"
  end

  create_table "investments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.integer "number_of_panels"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "project_sku"
    t.jsonb "payment"
    t.integer "amount_cents", default: 0, null: false
    t.index ["project_id"], name: "index_investments_on_project_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "contacted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "subject"
  end

  create_table "outputs", force: :cascade do |t|
    t.date "date"
    t.float "quantity"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "detailedtime"
    t.integer "production"
    t.index ["project_id"], name: "index_outputs_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.float "price_per_panel"
    t.float "yield"
    t.date "start_date"
    t.date "end_date"
    t.integer "panels_quantity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_logo_name"
    t.string "company_url"
    t.string "country"
    t.integer "price_cents", default: 0, null: false
    t.date "end_of_contract"
    t.text "description"
    t.date "crowdfunding_start_date"
    t.date "crowdfunding_end_date"
    t.date "comissioning_date"
    t.integer "roi_decimals"
    t.integer "kwh_price_cents", default: 0, null: false
    t.integer "panel_watt"
    t.float "lat"
    t.float "lon"
    t.string "photo"
    t.text "long_description"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.bigint "investment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investment_id"], name: "index_rents_on_investment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.boolean "is_company"
    t.string "company_name"
    t.boolean "admin", default: false
    t.string "photo"
    t.text "company_description"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "images", "projects"
  add_foreign_key "investments", "projects"
  add_foreign_key "investments", "users"
  add_foreign_key "outputs", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "rents", "investments"
end
