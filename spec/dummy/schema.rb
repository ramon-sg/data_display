ActiveRecord::Schema.define do
  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.date     "birthday"
    t.boolean  "admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end
end