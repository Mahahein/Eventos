class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :event_id
      t.integer :product_id
      t.integer :quantity
      t.integer :price
      t.decimal :discount


      t.timestamps
    end
  end
end
