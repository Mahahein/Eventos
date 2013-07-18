class Item < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :price, :discount
  
  validates :product_id, :quantity, :price, :presence => true 
  belongs_to :product
  belongs_to :event
end
