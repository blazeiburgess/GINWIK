class AddDescriptionToSeveralTables < ActiveRecord::Migration
  def change
    add_column :languages, :description, :text
    add_column :technological_developments, :description, :text
    add_column :histories, :description, :text
    add_column :governmental_organizations, :description, :text
    add_column :environments, :description, :text
    add_column :cultures, :description, :text
    add_column :conflicts, :description, :text

  end
end
