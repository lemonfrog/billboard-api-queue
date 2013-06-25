namespace :billboard do
  desc "Process local Order-Queue"
  task :process_queue => [:environment] do
    BillboardApi::OrderQueue.all.each do |entry|
      puts "Procesing #{entry}"
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
        puts "  Customer #{customer} saved."
        order.customer_id = customer.id
        if order.save
          puts "  Order #{order} saved."
          order.save # send an update request
          entry.destroy
          puts "  Entry #{entry} deleted."
        end
      end
    end
  end
end