class AddSubjectToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :subject, :text
  end
end
