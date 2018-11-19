class AddCompanyDescriptionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_description, :string
  end
end
