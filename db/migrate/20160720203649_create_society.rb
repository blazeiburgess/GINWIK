class CreateSociety < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
