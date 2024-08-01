class CreateTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :templates do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.string :content, null: false
      t.string :status, null: false, default: 'draft'
      t.string :channel_code
      t.string :callback_method
      t.string :callback_url
      t.jsonb  :callback_headers, default: {}
      t.references :channel, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.timestamps
    end
  end
end
