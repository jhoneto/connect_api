class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.references :organization, null: false, foreign_key: true
      t.string     :name, null: false
      t.string     :uuid, null: false
      t.string     :callback_method, null: false
      t.string     :callback_url, null: true
      t.jsonb      :callback_headers, null: false, default: {}
      t.string     :provider, null: false
      t.string     :channel_type, null: false
      t.jsonb      :config, null: false, default: {}
      t.timestamps
    end
  end
end
