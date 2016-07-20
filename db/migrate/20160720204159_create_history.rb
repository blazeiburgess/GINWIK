class CreateHistory < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.text :boundary_disputes
      t.text :ethnic_disputes
      t.text :social_disputes
      t.integer :society_id
    end
  end
end
