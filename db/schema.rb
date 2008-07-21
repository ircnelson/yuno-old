# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 11) do

  create_table "assets", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "category_id"
    t.string   "category_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_contents", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "content_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "content_id"
    t.string   "body"
    t.string   "name"
    t.string   "uri"
    t.string   "email"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "contents", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published",       :default => false
    t.datetime "published_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_filter", :default => 0
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "body"
    t.boolean  "published",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "location",   :default => "bottom"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "remember_token"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "level",                                   :default => "normal"
    t.string   "fcktoolbar",                              :default => "Basic"
    t.string   "time_zone"
  end

end
