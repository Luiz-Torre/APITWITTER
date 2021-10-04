class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.date "birthdate"
      t.string "cellphone"
      t.string "nickname"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "validate_token"
      t.string "password_digest"
      t.boolean "email_confirmed", default: false
      t.datetime "validate_token_sent_at"
    end
  end
end
