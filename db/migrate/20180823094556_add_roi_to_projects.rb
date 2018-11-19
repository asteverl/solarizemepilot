class AddRoiToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :roi_decimals, :integer
  end
end
