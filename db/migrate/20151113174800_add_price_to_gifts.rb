class AddPriceToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :price, :decimal, default: 0.0
  end
end
