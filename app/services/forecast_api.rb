require "json"
require "rest-client"

class ForecastApi
  def initialize(project_id)
    # Fetch the project from the database
    @project = Project.find(project_id.to_i)
  end

  def generate_output
    # fetch  latitude, longitude, etc. and insert them in the url (so url is dynamic)
    lat = @project.lat
    lon = @project.lon
    kwc = @project.kwc

    # API CALL
    # url = "https://api.forecast.solar/estimate/#{lat.to_s}/#{lon.to_s}/37/0/#{kwc.to_s}"
    # p url
    # response = RestClient.get "https://api.forecast.solar/estimate/52.0/12.0/37/0/324.02" for testing, with non pro API settings limited coordinates
    response = RestClient.get url
    repos = JSON.parse(response)

    #for the daily watt production, create a row by hour
    repos_watt = repos['result']['watts']
    date = Date.today.to_s

    repos_watt.each do |key, value|
      output = Output.new ()
      output.project = @project
      output.detailedtime = DateTime.parse(key)
      output.date = DateTime.parse(key).to_date
      output.production = value / 1000

      if output.date == Date.today
        output.save!
      end
    end

    # to avoid duplicating Quantit for many hours, create one row per day
    repos_day_production = repos['result']['watt_hours_day'][date]

    output = Output.new
    city = Project.where(name: "Paris Offices").first
    output.project = city
    output.date = Date.today
    output.quantity = repos_day_production / 1000
    output.save!

    # # for testing when API exeeds requests
    # if repos_date
    #   value = repos_date[1]
    #   # with json response, create a new output with the information you get
    #   Output.create(date: Date.today, project: @project, quantity: value)
    # else
    #   Output.create(date: Date.today, project: @project, quantity: 105)
    # end
  end
end

