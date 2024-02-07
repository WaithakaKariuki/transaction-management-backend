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

ActiveRecord::Schema[7.0].define(version: 2024_02_06_220901) do
  create_table "account_trans_actions", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "trans_action_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_trans_actions_on_account_id"
    t.index ["trans_action_id"], name: "index_account_trans_actions_on_trans_action_id"
  end

  create_table "accounts", id: :string, force: :cascade do |t|
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trans_actions", id: :string, force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_trans_actions", "accounts"
  add_foreign_key "account_trans_actions", "trans_actions"
end
