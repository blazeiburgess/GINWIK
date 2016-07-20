class CreateEducation < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.text :description
      t.text :access
      t.text :diversity
      t.integer :society_id
    end
  end
end
