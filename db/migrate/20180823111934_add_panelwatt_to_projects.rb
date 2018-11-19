class AddPanelwattToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :panel_watt, :integer
    add_column :projects, :lat, :float
    add_column :projects, :lon, :float
  end
end
