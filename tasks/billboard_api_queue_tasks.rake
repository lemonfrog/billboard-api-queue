namespace :billboard do
  desc "Process local Order-Queue"
  task :process_queue => [:environment] do
    puts "Start process queue entries"
    
    BillboardApi::OrderQueue.all.each do |entry|
      order = entry.order
      if order.save
        entry.delete
      end
    end
    
    puts "Queue entries were processed"
  end
end