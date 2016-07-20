class CreateEnvironment < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.text :geography
      t.text :biodiversity
      t.integer :society_id
    end
  end
end
