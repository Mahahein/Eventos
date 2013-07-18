class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :customer_id
      t.datetime :date_request
      t.datetime :start_at        
      t.datetime :end_at
      t.decimal :discount
      t.timestamps
    end
  end
end
