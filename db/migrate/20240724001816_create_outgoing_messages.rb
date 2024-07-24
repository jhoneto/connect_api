class CreateOutgoingMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :outgoing_messages do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.string     :uuid, null: false
      t.string     :provider_message_id
      t.jsonb      :payload, null: false
      t.text       :last_error
      t.boolean    :proccessed, default: false
      t.datetime   :sended_at
      t.datetime   :delivered_at
      t.datetime   :read_at
      t.timestamps
    end
  end
end
