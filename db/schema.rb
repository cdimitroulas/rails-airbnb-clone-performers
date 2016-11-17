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

ActiveRecord::Schema.define(version: 20161117105154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "price"
    t.string   "location"
    t.integer  "user_id"
    t.integer  "performer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["performer_id"], name: "index_bookings_on_performer_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "performers", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "",                                                                                                       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                                                        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "password"
    t.string   "category"
    t.text     "event_types",                                                                                                                                            array: true
    t.text     "profile"
    t.string   "travelling_distance"
    t.float    "hourly_rate"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "postcode"
    t.string   "phone_number"
    t.string   "picture"
    t.string   "video"
    t.datetime "created_at",                                                                                                                                null: false
    t.datetime "updated_at",                                                                                                                                null: false
    t.integer  "members"
    t.string   "requirements"
    t.integer  "discount"
    t.string   "cancellation_policy"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "profile_picture",        default: "http://res.cloudinary.com/dplnt2ozo/image/upload/v1479313226/Airbnb-clone/iStock_000033523696Small.jpg"
    t.index ["confirmation_token"], name: "index_performers_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_performers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_performers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "performer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["performer_id"], name: "index_reviews_on_performer_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "email",                  default: "",                                                                                                       null: false
    t.string   "encrypted_password",     default: "",                                                                                                       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                                                        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                                                                                                                null: false
    t.datetime "updated_at",                                                                                                                                null: false
    t.string   "profile_picture",        default: "http://res.cloudinary.com/dplnt2ozo/image/upload/v1479313226/Airbnb-clone/iStock_000033523696Small.jpg"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "performers"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "performers"
  add_foreign_key "reviews", "users"
end
