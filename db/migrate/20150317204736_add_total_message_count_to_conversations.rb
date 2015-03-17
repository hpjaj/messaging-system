class AddTotalMessageCountToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :total_message_count, :integer, {:null => false, :default => 0 }
  end
end
