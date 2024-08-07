class CreateIncomingMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :incoming_messages do |t|
      t.references :organization, null: false, foreign_key: true
      t.string     :provider, null: false
      t.string     :channel_type, null: false
      t.jsonb      :payload, null: false
      t.text       :last_error
      t.boolean    :processed, default: false
      t.timestamps
    end
  end
end
