class AddKwhpriceToProjects < ActiveRecord::Migration[5.2]
  def change
    add_monetize :projects, :kwh_price, currency: { present: false }
  end
end
