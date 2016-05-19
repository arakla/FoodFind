class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.boolean :is_premium

      t.timestamps null: false
    end
  end
end
