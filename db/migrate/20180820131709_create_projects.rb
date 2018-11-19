class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.float :price_per_panel
      t.float :yield
      t.date :start_date
      t.date :end_date
      t.integer :panels_quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
