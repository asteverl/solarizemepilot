class Output < ApplicationRecord
  belongs_to :project

  def output_today
    self.where("date = ?", Date.today)
  end

end
