class CreateEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|
      t.references :event, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
