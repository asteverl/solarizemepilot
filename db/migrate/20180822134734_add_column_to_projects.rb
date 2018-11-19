class AddColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :crowdfunding_start_date, :date
    add_column :projects, :crowdfunding_end_date, :date
    add_column :projects, :comissioning_date, :date
  end
end
