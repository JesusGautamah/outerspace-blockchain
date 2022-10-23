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

ActiveRecord::Schema[7.0].define(version: 2022_10_23_114408) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptable_number_sequences", force: :cascade do |t|
    t.string "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acceptable_symbol_sequences", force: :cascade do |t|
    t.string "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acceptable_words", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "nonce"
    t.string "previous_hash"
    t.text "block_data"
    t.string "connections"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chain_id", null: false
    t.integer "contracts_count", default: 0, null: false
    t.integer "contracts_limit", default: 0, null: false
    t.index ["chain_id"], name: "index_blocks_on_chain_id"
  end

  create_table "chains", force: :cascade do |t|
    t.string "name", null: false
    t.integer "blocks_count", default: 0, null: false
    t.string "maintainer", null: false
    t.string "chain_version", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_chains_on_name", unique: true
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "signatures_count", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pools", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.integer "users_count", default: 0, null: false
    t.integer "signatures_count", default: 0, null: false
    t.float "amount", default: 0.0, null: false
    t.integer "stage", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_pools_on_block_id"
  end

  create_table "signatures", force: :cascade do |t|
    t.string "signature", null: false
    t.datetime "time_ref", null: false
    t.bigint "contract_id", null: false
    t.string "common_word", null: false
    t.string "symbol_sequence", null: false
    t.string "number_sequence", null: false
    t.string "verify_sig", null: false
    t.string "block_hash", null: false
    t.string "signature_hash", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_signatures_on_contract_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pool_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_acceptable_hash"
    t.datetime "time_ref"
    t.index ["pool_id"], name: "index_tickets_on_pool_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "sender_key", null: false
    t.string "receiver_key", null: false
    t.time "signature_time", null: false
    t.integer "status", default: 0, null: false
    t.text "data"
    t.string "upl_file"
    t.string "upl_file_name"
    t.string "upl_file_type"
    t.string "upl_file_size"
    t.string "upl_file_hash"
    t.float "amount", default: 0.0, null: false
    t.float "fee", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "block_id", null: false
    t.index ["block_id"], name: "index_transactions_on_block_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 10, null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "acceptable_word_list"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "pr_key", null: false
    t.string "pv_key", null: false
    t.float "balance", default: 0.0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "blocks", "chains"
  add_foreign_key "pools", "blocks"
  add_foreign_key "signatures", "contracts"
  add_foreign_key "tickets", "pools"
  add_foreign_key "tickets", "users"
  add_foreign_key "transactions", "blocks"
  add_foreign_key "wallets", "users"
end
