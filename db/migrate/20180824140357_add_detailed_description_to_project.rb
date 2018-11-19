class AddDetailedDescriptionToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :long_description, :string
  end
end
