require 'faker'

puts "Erasing database"

Project.delete_all
User.delete_all
Investment.delete_all
Output.delete_all

puts "generating admin"

User.create( email: "admin@admin.com", password: 123456, admin: true )

puts "generating investors"
User.create(
  email: "alexis@solar.com",
  password: 123456,
  username: "alexis",
  first_name: "Alexis",
  last_name: "Steve",
  birth_date: Faker::Date.birthday(17, 80),
  is_company: false,
  company_name: nil
  )

puts "generating investors"
User.create(
  email: "john@doe.com",
  password: 123456,
  username: "johndoe",
  first_name: "John",
  last_name: "Doe",
  birth_date: Faker::Date.birthday(17, 70),
  is_company: false,
  company_name: nil
  )

User.create(
  email: "jane@doe.com",
  password: 123456,
  username: "janedoe",
  first_name: "Jane",
  last_name: "Doe",
  birth_date: Faker::Date.birthday(17, 70),
  is_company: false,
  company_name: nil
  )

puts "generating companies"
User.create(
  email: "cocacola@company.com",
  password: 123456,
  username: "cocacola",
  first_name: nil,
  last_name: nil,
  birth_date: nil,
  is_company: true,
  company_name: "Coca-Cola",
  company_description: "The Coca-Cola Company is an American corporation, and manufacturer, retailer, and marketer of nonalcoholic beverage concentrates and syrups.[2] The company is best known for its flagship product Coca-Cola, invented in 1886 by pharmacist John Stith Pemberton in Atlanta, Georgia.",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535108918/akhcxlnmwrt9fqyiultg.jpg"
  )

User.create(
  email: "Nike@company.com",
  password: 123456,
  username: "Nike",
  first_name: nil,
  last_name: nil,
  birth_date: nil,
  is_company: true,
  company_name: "Nike",
  company_description: "Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area.",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535109018/vnijnbdtozqinposnkap.jpg"
  )

puts "created #{User.count} users"

puts "generating projects"



running_coca = Project.new(
  name: "Madrid HQ",
  description: "Excelent location with very reliable company!",
  price_cents: 27000,
  panel_watt: 320,
  lat: 52,
  lon: 12,
  kwh_price_cents: 22,
  yield: 0.162,
  roi_decimals: 612,
  crowdfunding_start_date: Date.new(2018, 1, 2),
  crowdfunding_end_date: Date.new(2018, 9, 1),
  end_of_contract: Date.new(2030, 12, 31),
  comissioning_date: Date.new(2018, 12, 31),
  panels_quantity: 4000,
  address: "Madrid",
  country: "Spain",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535106441/jgycj9bei1zkxq7c1qwu.jpg"
  )
running_coca.user = User.where(company_name: "Coca-Cola").first
running_coca.save!

future_campaign = Project.new(
  name: "Vienna HQ",
  description: "Another project with Nike, this time in a country offering strong incentives for investing in green energy!",
  long_description: "Nike trusts us for another project, this time in Austria. The minimum investment and the yield are similar as their Italian HQ project. Though Vienna does not have as many sun as Roma, the government provides financial incentives for solar energy.\n\nVienna is located in northeastern Austria, at the easternmost extension of the Alps in the Vienna Basin. The earliest settlement, at the location of today's inner city, was south of the meandering Danube while the city now spans both sides of the river. Elevation ranges from 151 to 542 m (495 to 1,778 ft). The city has a total area of 414.65 square kilometres (160.1 sq mi), making it the largest city in Austria by area.\n\nVienna has a humid continental climate bordering a humid subtropical climate (hovering just below 22 °C in July and August), and features, according to the Köppen classification, a Cfb (oceanic) -climate. The city has relatively warm summers, however with periodical precipitations that can reach its most in June and July and average high temperatures of 21 to 27 °C, with a record maximum exceeding 38 °C and a record low of around 7 °C. Winters are relatively dry and very cold with average temperatures at about freezing point.",
  price_cents: 35000,
  panel_watt: 270,
  lat: 52,
  lon: 12,
  kwh_price_cents: 25,
  yield: 0.182,
  roi_decimals: 712,
  crowdfunding_start_date: Date.new(2018, 8, 2),
  crowdfunding_end_date: Date.new(2018, 10, 1),
  comissioning_date: Date.new(2018, 12, 31),
  end_of_contract: Date.new(2035, 12, 31),
  panels_quantity: 800,
  address: "Vienna",
  country: "Austria",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535108270/hlt6yqkbp36ju5uk49jj.jpg"
  )
future_campaign.user = User.where(company_name: "Nike").first
future_campaign.save!


running_coca = Project.new(
  name: "Madrid Depot",
  description: "Excelent location with very reliable company!",
  price_cents: 32000,
  panel_watt: 320,
  lat: 52,
  lon: 12,
  kwh_price_cents: 22,
  yield: 0.162,
  roi_decimals: 612,
  crowdfunding_start_date: Date.new(2018, 1, 2),
  crowdfunding_end_date: Date.new(2018, 10, 20),
  end_of_contract: Date.new(2030, 12, 31),
  comissioning_date: Date.new(2018, 12, 31),
  panels_quantity: 2000,
  address: "Madrid",
  country: "Spain",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535108222/avuoydt0sicqtpiybyee.jpg"
  )
running_coca.user = User.where(company_name: "Coca-Cola").first
running_coca.save!

future_campaign = Project.new(
  name: "Rome HQ",
  description: "Excelent location with very reliable company!",
  price_cents: 40000,
  panel_watt: 270,
  lat: 52,
  lon: 12,
  kwh_price_cents: 25,
  yield: 0.182,
  roi_decimals: 712,
  crowdfunding_start_date: Date.new(2018, 10, 2),
  crowdfunding_end_date: Date.new(2018, 11, 1),
  comissioning_date: Date.new(2018, 12, 31),
  end_of_contract: Date.new(2035, 12, 31),
  panels_quantity: 500,
  address: "Rome",
  country: "Italy",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535108330/ch3bxjozyrm1lkj8wh3n.jpg"
  )
future_campaign.user = User.where(company_name: "Nike").first
future_campaign.save!

running_Nike = Project.new(
  name: "Paris Offices",
  description: "Excelent location with very reliable company!",
  price_cents: 50000,
  panel_watt: 400,
  lat: 52,
  lon: 12,
  kwh_price_cents: 27,
  yield: 0.142,
  roi_decimals: 512,
  crowdfunding_start_date: Date.new(2017, 10, 2),
  crowdfunding_end_date: Date.new(2017, 11, 1),
  end_of_contract: Date.new(2038, 1, 31),
  comissioning_date: Date.new(2018, 1, 31),
  panels_quantity: 200,
  address: "Paris",
  country: "France",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535564045/hrj4wc5f7pmxmvdzzxjt.jpg"
  )
running_Nike.user = User.where(company_name: "Nike").first
running_Nike.save!

current_campaign = Project.new(
  name: "Rome Factory",
  description: "Another project with Nike, this time in a country offering strong incentives for investing in green energy!",
  long_description: "This brand new project on the top of the Italian factory of Coca-Cola is an amazing opportunity.\n\nWith a maximum of 11 hours of sun per day in average during the summer, Rome is a very profitable location for solar energy.\nThis project will generate an incredible yield of 18,2\% per year, which means that the break-even is reached in less than 6 years. Nike is committed to buy the energy produced during 20 years, so you are guaranteed a steady flow of incomes.\n\nSunshine duration in Rome is about 2,500 hours per year, from 111 – average 3.6 hours of sunshine per day in December to 332 – average 10.7 hours of sunshine per day in July. This is the middling value for the southern half of Europe because in this part of the continent, sunshine duration varies from about 2,000 to about 3,000 hours per year. However, this is 60% larger value than in northern half of Europe, where sunshine duration is around 1500 hours per year. In winter Rome has about three times more sun duration than in the northern half of Europe.",
  price_cents: 25000,
  panel_watt: 270,
  lat: 52,
  lon: 12,
  kwh_price_cents: 21,
  yield: 0.151,
  roi_decimals: 412,
  crowdfunding_start_date: Date.new(2015, 7, 23),
  crowdfunding_end_date: Date.new(2015, 9, 22),
  comissioning_date: Date.new(2015, 12, 31),
  end_of_contract: Date.new(2038, 12, 31),
  panels_quantity: 1200,
  address: "Rome",
  country: "Italy",
  remote_photo_url: "https://res.cloudinary.com/dafctmpcz/image/upload/v1535564117/firi3llyyswzyrhoehkx.jpg"
  )
current_campaign.user = User.where(company_name: "Coca-Cola").first
current_campaign.save!

puts "created #{Project.count} projects"

puts "generating investments"

investment = Investment.new(
  number_of_panels: 20,
  state: "confirmed"
  )
investment.user = User.where(username: "alexis").first
investment.project = Project.where(name: "Rome Factory").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 10,
  state: "confirmed"
  )
investment.user = User.where(username: "alexis").first
investment.project = Project.where(name: "Paris Offices").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 1180,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Rome Factory").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 400,
  state: "confirmed"
  )
investment.user = User.where(username: "janedoe").first
investment.project = Project.where(name: "Vienna HQ").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 500,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Madrid Depot").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 3700,
  state: "confirmed"
  )
investment.user = User.where(username: "johndoe").first
investment.project = Project.where(name: "Madrid HQ").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 90,
  state: "confirmed"
  )
investment.user = User.where(email: "admin@admin.com").first
investment.project = Project.where(name: "Paris Offices").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

investment = Investment.new(
  number_of_panels: 100,
  state: "confirmed"
  )
investment.user = User.where(email: "john@doe.com").first
investment.project = Project.where(name: "Paris Offices").first
investment.amount_cents = investment.number_of_panels * investment.project.price_cents
investment.save!

puts "created #{Investment.count} investments"

puts "generating random outputs"

days = 0
1300.times do
  output = Output.new ()
  madrid = Project.where(name: "Rome Factory").first
  output.project = madrid
  output.quantity = madrid.panel_watt * madrid.panels_quantity  * 5 * rand(1000) / 500 / 1000
  output.date = Date.today - days
  days += 1
  output.save!
end

days = 0
365.times do
  output = Output.new ()
  madrid = Project.where(name: "Paris Offices").first
  output.project = madrid
  output.quantity = madrid.panel_watt * madrid.panels_quantity  * 5 * rand(1000) / 500 /1000
  output.date = Date.today - days
  days += 1
  output.save!
end

# on API format to test how to only extract Todays values and not tomorrows

require "json"
require "rest-client"

projects = Project.where("comissioning_date <= ?", Date.today)
projects.each do |project|

  lat = project.lat
  lon = project.lon
  kwc = project.kwc

  response = RestClient.get "https://api.forecast.solar/estimate/#{lat.to_s}/#{lon.to_s}/37/0/#{kwc.to_s}"
  repos = JSON.parse(response)

  repos_watt = repos['result']['watts']
  date = Date.today.to_s

  repos_day_production = repos['result']['watt_hours_day'][date]

  repos_watt.each do |key, value|
    output = Output.new ()
    output.project = project
    output.detailedtime = DateTime.parse(key)
    output.date = DateTime.parse(key).to_date
    output.production = value / 1000

    if output.date == Date.today
      output.save!
    end
  end

  # to avoid duplicating Quantit for many hours, create one row per day
  output = Output.new
  output.project = project
  output.date = Date.today
  output.quantity = repos_day_production / 1000
  output.save!

end
# production_hash = {"2018-08-27 06:09:00" => 0,
#      "2018-08-27 06:27:00" => 11.34,
#      "2018-08-27 06:45:00" => 90.72,
#      "2018-08-27 07:00:00" => 158.76,
#      "2018-08-27 08:00:00" => 612.36,
#      "2018-08-27 09:00:00" => 1298.43,
#      "2018-08-27 10:00:00" => 1978.83,
#      "2018-08-27 11:00:00" => 2511.81,
#      "2018-08-27 12:00:00" => 2823.66,
#      "2018-08-27 13:00:00" => 2109.24,
#      "2018-08-27 14:00:00" => 1638.63,
#      "2018-08-27 15:00:00" => 1428.84,
#      "2018-08-27 16:00:00" => 1116.99,
#      "2018-08-27 17:00:00" => 759.78,
#      "2018-08-27 18:00:00" => 402.57,
#      "2018-08-27 19:00:00" => 124.74,
#      "2018-08-27 19:38:00" => 17.01,
#      "2018-08-27 20:16:00" => 0,
#      "2018-08-28 06:10:00" => 0,
#      "2018-08-28 06:28:00" => 11.34,
#      "2018-08-28 06:45:00" => 79.38,
#      "2018-08-28 07:00:00" => 141.75,
#      "2018-08-28 08:00:00" => 555.66,
#      "2018-08-28 09:00:00" => 1224.72,
#      "2018-08-28 10:00:00" => 1956.15,
#      "2018-08-28 11:00:00" => 2596.86,
#      "2018-08-28 12:00:00" => 3056.13,
#      "2018-08-28 13:00:00" => 3203.55,
#      "2018-08-28 14:00:00" => 3010.77,
#      "2018-08-28 15:00:00" => 2562.84,
#      "2018-08-28 16:00:00" => 1905.12,
#      "2018-08-28 17:00:00" => 1190.7,
#      "2018-08-28 18:00:00" => 555.66,
#      "2018-08-28 19:00:00" => 136.08,
#      "2018-08-28 19:37:00" => 17.01,
#      "2018-08-28 20:14:00" => 0}

# production_hash.each do |key, value|
#   output = Output.new ()
#   city = Project.where(name: "Paris Offices").first
#   output.project = city
#   output.detailedtime = DateTime.parse(key)
#   output.date = DateTime.parse(key).to_date
#   output.production = value
#   # output.quantity = 1000

#   if output.date == Date.today
#     output.save!
#   end
# end

puts "generated #{Output.count} outputs"


