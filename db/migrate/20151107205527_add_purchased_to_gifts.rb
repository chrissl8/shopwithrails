class AddPurchasedToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :purchased, :integer, default: 0
  end
end
