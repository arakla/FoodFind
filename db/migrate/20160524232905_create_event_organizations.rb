class CreateEventOrganizations < ActiveRecord::Migration
  def change
    create_table :event_organizations do |t|
      t.references :event, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
