class Event < ActiveRecord::Base
  #attr_accessible :start_at, :end_at, :name, :user_id
  #has_event_calendar
  #belongs_to :user
  attr_accessible  :customer_id, :date_request, :discount, :name, :start_at, :end_at
  validates :customer_id, :presence => true 
  belongs_to :customer
  has_event_calendar
  has_many :items
  
  #accepts_nested_attributes_for :items
  
  def totalquantity
    iTotal = 0
    self.items.each do |i|
      iTotal = iTotal + i.quantity
    end
    totalquantity = iTotal
  end

  def totalprice
    iTotal = 0;
    self.items.each do |i|
      iTotal = iTotal + (i.price * i.quantity)
    end
    totalitem = iTotal
  end
  
  def totaldiscount
    iTotal = 0;
    self.items.each do |i|
      iTotal = iTotal + (i.price * i.quantity)
    end
    iTotal = (iTotal * (100 - self.discount)) / 100
    totaldescuento= iTotal
  end
end
