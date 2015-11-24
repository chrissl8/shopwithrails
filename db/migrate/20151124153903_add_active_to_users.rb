class AddActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_active, :integer, default: 0
  end
end
