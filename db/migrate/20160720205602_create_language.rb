class CreateLanguage < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :official_language
      t.text :diversity
      t.integer :society_id
    end
  end
end
