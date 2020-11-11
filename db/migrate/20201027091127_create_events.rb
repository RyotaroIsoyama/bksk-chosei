class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :stdate
      t.date :enddate
      t.time :sttime
      t.time :endtime
      t.integer :span
      t.string :owner
      t.string :hashforurl

      t.timestamps
    end
  end
end
