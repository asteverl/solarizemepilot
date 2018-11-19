class AddColumnToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :state, :string
    add_column :investments, :project_sku, :string
    add_column :investments, :payment, :jsonb
    add_monetize :investments, :amount, currency: { present: false }
  end
end
