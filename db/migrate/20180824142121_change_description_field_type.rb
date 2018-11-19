class ChangeDescriptionFieldType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :company_description, :text
    change_column :projects, :long_description, :text
  end
end
