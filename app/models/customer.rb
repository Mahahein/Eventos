class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :number
  has_many :events
end
