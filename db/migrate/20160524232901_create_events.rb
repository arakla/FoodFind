class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :image_path
      t.text :description
      t.integer :age_restriction
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
