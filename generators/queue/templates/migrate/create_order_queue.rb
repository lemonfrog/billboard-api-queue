class CreateOrderQueue < ActiveRecord::Migration
  def self.up
    create_table "order_queues", :force => true do |t|
      t.column :order, :text
      t.column :user, :text
      t.column :line_items, :text
      t.column :authentication, :text
      t.column :reminder_charges, :text
    end
  end

  def self.down
    drop_table "order_queues"
  end
end

