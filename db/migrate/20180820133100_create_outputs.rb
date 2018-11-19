class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.date :date
      t.float :quantity
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
