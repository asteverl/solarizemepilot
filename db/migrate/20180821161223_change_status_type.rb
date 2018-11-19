class ChangeStatusType < ActiveRecord::Migration[5.2]
  def change
    change_column :investments, :status, :string
  end
end
