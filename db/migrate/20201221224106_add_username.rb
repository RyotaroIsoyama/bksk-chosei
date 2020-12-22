class AddUsername < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :time_schedules, :user_id, :integer
  end
end
