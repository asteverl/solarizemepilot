class AddDatetimeToOutputs < ActiveRecord::Migration[5.2]
  def change
    add_column :outputs, :detailedtime, :datetime
    add_column :outputs, :production, :integer
  end
end
