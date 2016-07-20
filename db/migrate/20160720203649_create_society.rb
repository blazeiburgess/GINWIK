class CreateSociety < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
    end
  end
end
