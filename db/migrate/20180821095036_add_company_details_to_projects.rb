class AddCompanyDetailsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :company_name, :string
    add_column :projects, :company_url, :string
  end
end
