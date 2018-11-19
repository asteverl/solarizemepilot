class Project < ApplicationRecord
  belongs_to :user
  has_many :investments, dependent: :destroy
  has_many :outputs, dependent: :destroy
  has_many :images

  validates :name, uniqueness: true, presence: true
  validates :price_cents, presence: true
  validates :yield, presence: true
  validates :panels_quantity, presence: true
  validates :crowdfunding_start_date, presence: true
  validates :crowdfunding_end_date, presence: true
  validates :comissioning_date, presence: true
  validates :end_of_contract, presence: true

  monetize :price_cents
  monetize :kwh_price_cents

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def days_to_completion
    if (crowdfunding_end_date - Date.today).to_i < 0
      days = 0
    else
      days = (crowdfunding_end_date - Date.today).to_i
    end
  end

  def completion_rate
    total_investment = self.investments.sum(:number_of_panels)
    (total_investment * 100 / panels_quantity).to_f # It returns the percentage in float: i.e. 5.0 (and not 0.05)
  end

  def available_panels
    sum = 0
    investments.each do |investment|
      sum += investment.number_of_panels
    end
    return panels_quantity - sum
  end

  def status
    if Date.today - crowdfunding_end_date < 0
      return "Crowdfunding"
    else
      return "Completed"
    end
    # if Date.today - crowdfunding_start_date < 0
    #   return "Future crowdfunding"
    # elsif Date.today - crowdfunding_end_date < 0
    #   return "Active crowdfunding"
    # elsif Date.today - comissioning_date < 0
    #   return "Under construction"
    # else
    #   return "Operational"
    # end
  end

  def total_cost
    panels_quantity * price
  end

  def funds_pledged
    price * (panels_quantity - available_panels)
  end

  def remaining_crowdfunding_days
    if status == "Crowdfunding"
      return "#{days_to_completion} days to go"
    else
      return "Project already fully funded!"
    end
  end

  def completion_rate
    funds_pledged / total_cost * 100
  end

  def active_months
    start_date_month = comissioning_date.year * 12 + comissioning_date.month
    current_month = (Date.today.year * 12 + Date.today.month)
    if current_month - start_date_month < 0
      0
    else
      current_month - start_date_month
    end
  end

  def remaining_months
    if active_months == 0
      duration_months
    else
      duration_months - active_months
    end
    # end_date_month = end_of_contract.year * 12 + end_of_contract.month
    # current_month = (Date.today.year * 12 + Date.today.month)
    # end_date_month - current_month
  end


  def duration_months
    start_date_month = comissioning_date.year * 12 + comissioning_date.month
    end_date_month = end_of_contract.year * 12 + end_of_contract.month
    end_date_month - start_date_month
  end

  def to_years(month)
    long = month / 12.0
    decimals = long * 10
    decimals_to_int = decimals.to_i
    decimals_to_int / 10.0
  end

  def duration_years
    to_years(duration_months)
  end

  def remaining_years
    to_years(remaining_months)
  end

  def active_years
    to_years(active_months)
  end

  def kwc
    panels_quantity * panel_watt / 1000
  end
end
