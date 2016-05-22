class CreateUserOrganizations < ActiveRecord::Migration
  def change
    create_table :user_organizations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.string :org_role

      t.timestamps null: false
    end
  end
end
