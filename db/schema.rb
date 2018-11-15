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

ActiveRecord::Schema.define(version: 2018_07_17_100230) do

  create_table "agsearches", force: :cascade do |t|
    t.string "plaka"
    t.date "min_date"
    t.date "max_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aracgideris", force: :cascade do |t|
    t.float "yakit"
    t.float "mtv"
    t.float "bakim"
    t.float "sigorta"
    t.float "kasko"
    t.string "plaka"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aracs", force: :cascade do |t|
    t.string "plaka"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bakiyes", force: :cascade do |t|
    t.string "teslim_yeri"
    t.float "toplam_borc"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "firmagideris", force: :cascade do |t|
    t.float "elektrik"
    t.float "su"
    t.float "kira"
    t.float "dogalgaz"
    t.float "vergi"
    t.float "yemek"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "harcanansuts", force: :cascade do |t|
    t.integer "harcanan"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iades", force: :cascade do |t|
    t.string "teslim_yeri"
    t.string "adi"
    t.string "paket_tipi"
    t.integer "adet"
    t.float "birim_fiyat"
    t.float "toplam_fiyat"
    t.date "date"
    t.string "dagitici"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "isearches", force: :cascade do |t|
    t.string "teslim_yeri"
    t.string "adi"
    t.string "paket_tipi"
    t.string "dagitici"
    t.date "min_date"
    t.date "max_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "odemes", force: :cascade do |t|
    t.string "teslim_yeri"
    t.float "odeme_miktari"
    t.string "dagitici"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "osearches", force: :cascade do |t|
    t.string "teslim_yeri"
    t.string "dagitici"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "max_date"
  end

  create_table "pakettipis", force: :cascade do |t|
    t.string "paket_tipi"
    t.integer "urunadi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["urunadi_id"], name: "index_pakettipis_on_urunadi_id"
  end

  create_table "personelgideris", force: :cascade do |t|
    t.float "maas"
    t.float "sigorta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "satilans", force: :cascade do |t|
    t.string "teslim_yeri"
    t.string "adi"
    t.string "paket_tipi"
    t.integer "adet"
    t.float "birim_fiyat"
    t.float "toplam_fiyat"
    t.date "date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_satilans_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "teslim_yeri"
    t.string "adi"
    t.string "paket_tipi"
    t.string "dağitici"
    t.date "min_date"
    t.date "max_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suts", force: :cascade do |t|
    t.integer "miktar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "urunadis", force: :cascade do |t|
    t.string "adi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "urunlers", force: :cascade do |t|
    t.string "adi"
    t.string "paket_tipi"
    t.integer "stok"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "uruns", force: :cascade do |t|
    t.string "adi"
    t.string "paket_tipi"
    t.integer "stok"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ad_soyad"
    t.string "username"
    t.boolean "is_deleted", default: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
