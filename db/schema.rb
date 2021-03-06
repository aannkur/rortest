# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_30_160616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_mandatory", default: false
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "institute_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["institute_id"], name: "index_documents_on_institute_id"
  end

  create_table "fee_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "billing_term", default: 0, null: false
    t.boolean "is_concesion", default: false
    t.boolean "is_optional_to_student", default: false, comment: "All the fee categories by default implement to the associated class. But if this flag set true then it is optional to student"
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "institute_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["institute_id"], name: "index_fee_categories_on_institute_id"
    t.index ["name"], name: "index_fee_categories_on_name"
  end

  create_table "institutes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
  end

  create_table "sclasses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "institute_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["institute_id"], name: "index_sclasses_on_institute_id"
    t.index ["name"], name: "index_sclasses_on_name"
  end

  create_table "student_documents", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "document_id", null: false
    t.json "attachments"
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_student_documents_on_document_id"
    t.index ["student_id"], name: "index_student_documents_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "sclass_id", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "roll_number"
    t.string "phone_number"
    t.string "emergency_number"
    t.string "email"
    t.string "father_name"
    t.string "mother_name"
    t.text "permanent_address"
    t.text "residential_address"
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "institute_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["first_name"], name: "index_students_on_first_name"
    t.index ["institute_id"], name: "index_students_on_institute_id"
    t.index ["last_name"], name: "index_students_on_last_name"
    t.index ["roll_number"], name: "index_students_on_roll_number"
    t.index ["sclass_id"], name: "index_students_on_sclass_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "sclass_id"
    t.string "name"
    t.string "code"
    t.text "description"
    t.boolean "is_optional_to_student", default: false, comment: "All the subjects by default implement to the associated class. But if this flag set true then it is optional to student"
    t.boolean "active", default: true
    t.jsonb "options", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "institute_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["institute_id"], name: "index_subjects_on_institute_id"
    t.index ["sclass_id"], name: "index_subjects_on_sclass_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "admin", null: false
    t.bigint "institute_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["institute_id"], name: "index_users_on_institute_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "institutes"
  add_foreign_key "fee_categories", "institutes"
  add_foreign_key "sclasses", "institutes"
  add_foreign_key "student_documents", "documents"
  add_foreign_key "student_documents", "students"
  add_foreign_key "students", "institutes"
  add_foreign_key "students", "sclasses"
  add_foreign_key "subjects", "institutes"
  add_foreign_key "subjects", "sclasses"
  add_foreign_key "users", "institutes"
end
