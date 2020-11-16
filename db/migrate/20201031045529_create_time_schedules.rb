class CreateTimeSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :time_schedules do |t|
      t.string :username
      t.integer :event_id
      t.date :eventday
      t.boolean :t0
      t.boolean :t1
      t.boolean :t2
      t.boolean :t3
      t.boolean :t4
      t.boolean :t5
      t.boolean :t6
      t.boolean :t7
      t.boolean :t8
      t.boolean :t9
      t.boolean :t10
      t.boolean :t11
      t.boolean :t12
      t.boolean :t13
      t.boolean :t14
      t.boolean :t15
      t.boolean :t16
      t.boolean :t17
      t.boolean :t18
      t.boolean :t19
      t.boolean :t20
      t.boolean :t21
      t.boolean :t22
      t.boolean :t23
      t.boolean :t24
      t.boolean :t25
      t.boolean :t26
      t.boolean :t27
      t.boolean :t28
      t.boolean :t29
      t.boolean :t30
      t.boolean :t31
      t.boolean :t32
      t.boolean :t33
      t.boolean :t34
      t.boolean :t35
      t.boolean :t36
      t.boolean :t37
      t.boolean :t38
      t.boolean :t39
      t.boolean :t40
      t.boolean :t41
      t.boolean :t42
      t.boolean :t43
      t.boolean :t44
      t.boolean :t45
      t.boolean :t46
      t.boolean :t47

      t.timestamps
    end
  end
end
