
class FetchOutputProjectJob < ApplicationJob
  queue_as :default

  def perform(project_id)
    ForecastApi.new(project_id).generate_output
  end
end
