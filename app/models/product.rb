class Product < ActiveRecord::Base
  attr_accessible :category_id, :name, :price
  belongs_to :category
  has_many :items
end
