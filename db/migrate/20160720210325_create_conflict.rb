class CreateConflict < ActiveRecord::Migration
  def change
    create_table :conflicts do |t|
      t.integer :group_1_id
      t.integer :group_2_id
      t.integer :society_id
    end
  end
end
