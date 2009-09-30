namespace :billboard do
  desc "Process local Order-Queue"
  task :process_queue => [:environment] do
    puts "Start process queue entries"
    
    BillboardApi::OrderQueue.all.each do |entry|
      user = entry.user
      user.authentication = entry.authentication
      order = entry.order
      order.authentication = entry.authentication
      order.line_items_attributes = entry.line_items
      order.reminder_charges_attributes = entry.reminder_charges
      if user.save && order.save
        entry.delete
      end
    end
    
    puts "Queue entries were processed"
  end
end