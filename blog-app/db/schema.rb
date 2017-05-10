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

ActiveRecord::Schema.define(version: 20170505025334) do


  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",     limit: 65535
    t.string   "title_image"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "deleted"
    t.index ["category_id"], name: "fk_rails_af09d53ead", using: :btree
    t.index ["user_id"], name: "fk_rails_3d31dad1cc", using: :btree
  end

  create_table "attentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "article_id"
    t.integer "user_id"
    t.boolean "isLiked"
    t.boolean "isFollowed"
    t.boolean "notification_like"
    t.boolean "notification_follow"
    t.index ["article_id"], name: "fk_rails_f8c0064c5c", using: :btree
    t.index ["user_id"], name: "fk_rails_7e410e9217", using: :btree
  end
  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|

    t.string  "name"
    t.boolean "deleted"
  end

  create_table "categories_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id"
    t.integer "tag_id"
    t.index ["category_id"], name: "fk_rails_105f06f133", using: :btree
    t.index ["tag_id"], name: "fk_rails_937ed53929", using: :btree
  end



  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.text    "content",    limit: 65535
    t.boolean "isChecked"
    t.index ["article_id"], name: "fk_rails_3bf61a60d3", using: :btree
    t.index ["user_id"], name: "fk_rails_03de2dc08c", using: :btree
  end

  create_table "follow_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "be_followed_id"
    t.boolean "isChecked"
    t.index ["user_id"], name: "fk_rails_6bfac4ba98", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.boolean "deleted"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "fullname"
    t.string  "username"
    t.string  "email"
    t.string  "password"
    t.date    "birthday"
    t.boolean "access"
    t.boolean "blocked"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "attentions", "articles"
  add_foreign_key "attentions", "users"
  add_foreign_key "categories_tags", "categories"
  add_foreign_key "categories_tags", "tags"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "follow_users", "users"
end
