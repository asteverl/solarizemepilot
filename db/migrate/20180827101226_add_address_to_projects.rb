class AddAddressToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :address, :string
  end
end
