namespace :billboard do
  desc "Process local Order-Queue"
  task :process_queue => [:environment] do
    puts "Start process queue entries"
    
    BillboardApi::OrderQueue.all.each do |entry|
      user = entry.user
      order = entry.order
      if user.save && order.save
        entry.delete
      end
    end
    
    puts "Queue entries were processed"
  end
end