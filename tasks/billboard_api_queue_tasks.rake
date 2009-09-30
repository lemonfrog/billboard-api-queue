namespace :billboard do
  desc "Process local Order-Queue"
  task :process_queue => [:environment] do
    puts "Start process queue entries"
    
    BillboardApi::OrderQueue.all.each do |entry|
      user = entry.user
      user.authentication = {:api_key => BillboardApi::Config.instance.api_key, :username => BillboardApi::Config.instance.user_name}
      order = entry.order
      order.authentication = {:api_key => BillboardApi::Config.instance.api_key, :username => BillboardApi::Config.instance.user_name}
      if user.save && order.save
        entry.delete
      end
    end
    
    puts "Queue entries were processed"
  end
end