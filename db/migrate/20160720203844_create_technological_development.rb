class CreateTechnologicalDevelopment < ActiveRecord::Migration
  def change
    create_table :technological_developments do |t|
      t.text :production
      t.text :communications
      t.text :comparison
      t.integer :society_id
    end
  end
end
