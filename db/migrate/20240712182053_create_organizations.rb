class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string     :name, null: false
      t.string     :api_token, null: false
      t.timestamps
    end
  end
end
