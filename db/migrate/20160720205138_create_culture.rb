class CreateCulture < ActiveRecord::Migration
  def change
    create_table :cultures do |t|
      t.text :values
      t.text :diversity
      t.text :architecture
      t.text :music
      t.text :architecture
      t.text :cuisine
      t.text :religion
      t.text :folklore
      t.integer :society_id
    end
  end
end
