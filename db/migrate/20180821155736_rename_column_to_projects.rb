class RenameColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :company_name, :company_logo_name
  end
end
