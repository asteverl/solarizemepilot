class OutputJob < ApplicationJob
  queue_as :default

  def perform
    projects = Project.where("comissioning_date <= ?", Date.today)
    projects.each do |project|
      # Trigger background job for each project
      FetchOutputProjectJob.perform_now(project.id)
    end
  end
end

# SRP single responsibility principle


