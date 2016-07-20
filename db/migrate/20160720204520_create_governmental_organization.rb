class CreateGovernmentalOrganization < ActiveRecord::Migration
  def change
    create_table :governmental_organizations do |t|
      t.text :military
      t.text :judicial
      t.text :legislative
      t.integer :society_id
    end
  end
end
