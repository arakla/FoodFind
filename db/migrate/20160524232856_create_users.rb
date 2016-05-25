class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_of_birth
      t.string :loyalty_status
      t.datetime :last_login
      t.integer :login_count
      t.string :role

      t.timestamps null: false
    end
  end
end
