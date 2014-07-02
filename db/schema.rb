# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140626055759) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "color_surfaces", :force => true do |t|
    t.string   "title"
    t.string   "picture"
    t.string   "picture2"
    t.string   "picture3"
    t.string   "picture4"
    t.string   "picture5"
    t.integer  "decorate_company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "construction_items", :force => true do |t|
    t.string   "name"
    t.string   "type_of_work"
    t.string   "process_description"
    t.string   "unit"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "decorate_companies", :force => true do |t|
    t.string   "name"
    t.text     "brief"
    t.date     "created_date"
    t.string   "logo_path"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "home_image_settings", :force => true do |t|
    t.string "img1"
    t.string "img2"
    t.string "img3"
    t.string "img4"
    t.string "img5"
  end

  create_table "house_fitments", :force => true do |t|
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "main_material_brands", :force => true do |t|
    t.string "name"
    t.string "logo_path"
  end

  create_table "main_materials", :force => true do |t|
    t.string   "name"
    t.string   "picture"
    t.string   "type"
    t.float    "price"
    t.string   "type_of_work"
    t.integer  "main_material_brand_id"
    t.integer  "decorate_company_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "decorate_company_id"
    t.integer  "show_house_id"
    t.integer  "house_fitment_id"
    t.string   "status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "quotation_template_items", :force => true do |t|
    t.integer "quotation_template_id"
    t.integer "construction_item_id"
    t.integer "main_material_id"
    t.integer "construction_item_number"
    t.string  "category"
    t.float   "main_material_total_price"
    t.string  "supplementary_material_type"
    t.float   "supplementary_material_price"
    t.float   "supplementary_material_total_price"
    t.float   "labour_cost"
    t.float   "labour_cost_total"
    t.float   "total_price"
    t.string  "note"
  end

  add_index "quotation_template_items", ["construction_item_id"], :name => "index_quotation_template_items_on_construction_item_id"
  add_index "quotation_template_items", ["main_material_id"], :name => "index_quotation_template_items_on_main_material_id"
  add_index "quotation_template_items", ["quotation_template_id"], :name => "index_quotation_template_items_on_quotation_template_id"

  create_table "quotation_templates", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "show_house_main_material_brands", :force => true do |t|
    t.integer  "main_material_brand_id"
    t.integer  "show_house_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "show_house_pictures", :force => true do |t|
    t.string   "path"
    t.string   "brief"
    t.integer  "show_house_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "show_houses", :force => true do |t|
    t.string   "title"
    t.string   "area"
    t.string   "bedroom"
    t.string   "livingroom"
    t.string   "bathroom"
    t.text     "brief"
    t.text     "overview"
    t.string   "style"
    t.string   "usage"
    t.integer  "price"
    t.text     "need_to_know"
    t.integer  "decorate_company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.string  "avatar"
    t.string  "nickname"
    t.string  "gender"
    t.string  "location"
    t.string  "mobile"
    t.integer "user_id"
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",         :null => false
    t.string   "encrypted_password",     :default => "",         :null => false
    t.string   "role",                   :default => "customer"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,          :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
