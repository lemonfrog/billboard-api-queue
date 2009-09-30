module BillboardApi
  class OrderQueue < ActiveRecord::Base
    serialize :order
    serialize :user
    serialize :reminder_charges
    serialize :line_items
    serialize :authentication
    
    attr_accessible :order, :user, :reminder_charges, :line_items, :authentication
  end
end
