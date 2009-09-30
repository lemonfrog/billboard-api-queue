module BillboardApi
  class OrderQueue < ActiveRecord::Base
    serialize :order
    serialize :user
    
    attr_accessible :order, :user
  end
end
