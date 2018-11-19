class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :learn_more]

  def home
    top
  end

  def learn_more
  end

  private

  def top
    @projects = Project.all.where("crowdfunding_end_date > ?", Date.today).where("crowdfunding_start_date < ?", Date.today).order(crowdfunding_end_date: :asc).limit(3)
  end

end
