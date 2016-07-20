class CreateEconomicOrganization < ActiveRecord::Migration
  def change
    create_table :economic_organizations do |t|
      t.text :description
      t.text :standard_of_living
      t.text :means_of_access 
      t.text :diversity
      t.text :dependency_on_foreign_relations
      t.integer :society_id
    end
  end
end
