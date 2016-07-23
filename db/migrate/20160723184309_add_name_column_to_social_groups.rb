class AddNameColumnToSocialGroups < ActiveRecord::Migration
  def change
    add_column :social_groups, :name, :string
  end
end
