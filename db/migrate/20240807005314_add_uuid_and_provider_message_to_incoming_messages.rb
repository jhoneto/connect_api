class AddUuidAndProviderMessageToIncomingMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :incoming_messages, :uuid, :string
    add_column :incoming_messages, :provider_message_id, :string
  end
end
