namespace :billboard do
  desc "Process local Order-Queue"
  task :process_queue => [:environment] do
    puts "Start process queue entries"
    
    BillboardApi::OrderQueue.all.each do |entry|
      begin
        customer = entry.user
        customer.authentication = entry.authentication
        order = entry.order
        order.authentication = entry.authentication
        order.reminder_charges_attributes = entry.reminder_charges
        
        line_items = entry.line_items
        line_items.each do |line_item|
          line_item[:tax] = BillboardApi::Tax.find(:first, :params => {:authentication => entry.authentication}).id
        end
        order.line_items_attributes = line_items
        
        if customer.save
          order.customer_id = customer.id
          if order.save
            order.save # send an update request
            entry.delete
          end
        end
      rescue
        
      end
    end
    
    puts "Queue entries were processed"
  end
end