class CreateSocialGroup < ActiveRecord::Migration
  def change
    create_table :social_groups do |t|
      t.text :description
      t.boolean :legitimized
      t.integer :society_id
    end
  end
end
