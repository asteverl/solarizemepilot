class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :number_of_panels
      t.integer :status

      t.timestamps
    end
  end
end
