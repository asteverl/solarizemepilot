class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :rents

  validates :number_of_panels, presence: true
  validates :state, presence: true, inclusion: { in: %w(pending confirmed) }

  monetize :amount_cents

  def income_per_year
    amount * project.yield
  end

  def last_month_gain
    last_month_outputs = project.outputs.where(:date => 1.months.ago..Date.today)
    outputs = last_month_outputs.group_by_day(:date).maximum(:quantity)
    day_value = 0
    outputs.each do |date, value|
      day_value += value * project.kwh_price_cents
    end
    day_value / 100
  end

  def last_month_outputs
    project.outputs.where(:date => 1.months.ago..Date.today)
    # kwh.where(:date => 1.months.ago..Date.today)
  end

  def kwc
    two_decimal_wc = project.panel_watt * number_of_panels / 10
    wc_int = two_decimal_wc.to_i
    wc_decimals = wc_int / 100.0
  end

  def share_of_total_power
    ( kwc * 100  / project.kwc) / 100.00
  end

  def watt

  end

  def kwh_lifetime
    kwc * 1200 * 25
  end

  def yield_in_integer
    yield_decimals = project.yield * 100
  end

  def past_gains
    (project.active_months * amount_cents * yield_in_integer.to_i / 100 / 12 / 100)
  end

  def remaining_gains
    (project.remaining_months / 12 * amount_cents * yield_in_integer.to_i / 100 / 100)
  end

  def total_gains
    remaining_gains + past_gains
  end

  def profits
    (total_gains * 100 - amount_cents) / 100
  end

  def co2_tonn_lifetime
    kwh = kwh_lifetime * 0.352 / 1000
    kwh_decimals = kwh * 100
    kwh_integer = kwh_decimals.to_i
    kwh_flote_one_decimal = kwh_integer / 100.0
  end

  def elephants_lifetime
    co2_tonn_lifetime / 6
  end
  def trees_lifetime
    co2_tonn_lifetime * 0.9
  end

  def km_car_lifetime
    co2_tonn_lifetime * 1000 / 0.18
  end

  def turns_world_lifetime
    km_car_lifetime / 40000
  end
end
