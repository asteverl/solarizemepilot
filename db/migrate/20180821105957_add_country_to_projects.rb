class AddCountryToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :country, :string
  end
end
