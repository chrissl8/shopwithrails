class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :item
      t.string :store
      t.string :cost
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
