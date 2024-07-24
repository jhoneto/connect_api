class CreateOutcomingMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :outcoming_messages do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.string :provider_message_id
      t.jsonb :payload, null: false
      t.text :last_error
      t.boolean :proccessed, default: false
      t.timestamps
    end
  end
end
