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

ActiveRecord::Schema.define(version: 2020_10_31_045529) do

  create_table "events", force: :cascade do |t|
    t.date "stdate"
    t.date "enddate"
    t.time "sttime"
    t.time "endtime"
    t.integer "span"
    t.string "owner"
    t.string "hashforurl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_schedules", force: :cascade do |t|
    t.string "username"
    t.integer "event_id"
    t.integer "eventday"
    t.boolean "t0"
    t.boolean "t1"
    t.boolean "t2"
    t.boolean "t3"
    t.boolean "t4"
    t.boolean "t5"
    t.boolean "t6"
    t.boolean "t7"
    t.boolean "t8"
    t.boolean "t9"
    t.boolean "t10"
    t.boolean "t11"
    t.boolean "t12"
    t.boolean "t13"
    t.boolean "t14"
    t.boolean "t15"
    t.boolean "t16"
    t.boolean "t17"
    t.boolean "t18"
    t.boolean "t19"
    t.boolean "t20"
    t.boolean "t21"
    t.boolean "t22"
    t.boolean "t23"
    t.boolean "t24"
    t.boolean "t25"
    t.boolean "t26"
    t.boolean "t27"
    t.boolean "t28"
    t.boolean "t29"
    t.boolean "t30"
    t.boolean "t31"
    t.boolean "t32"
    t.boolean "t33"
    t.boolean "t34"
    t.boolean "t35"
    t.boolean "t36"
    t.boolean "t37"
    t.boolean "t38"
    t.boolean "t39"
    t.boolean "t40"
    t.boolean "t41"
    t.boolean "t42"
    t.boolean "t43"
    t.boolean "t44"
    t.boolean "t45"
    t.boolean "t46"
    t.boolean "t47"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
