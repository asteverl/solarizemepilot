class LeadsController < ApplicationController
  before_action :skip_authorization

  def new
    @lead = Lead.new
    session[:return_to] ||= request.referer #This allows to store in the session the page where the user was before going to the "contact us" page
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.save
    redirect_to session.delete(:return_to) #This redirects to the previously stored page
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :email, :phone)
  end
end
