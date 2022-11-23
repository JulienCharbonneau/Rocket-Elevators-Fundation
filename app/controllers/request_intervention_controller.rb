
  require "json"

class RequestInterventionController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def intervention_form
    
  end

  def create 
    puts params
    request_intervention = RequestIntervention.new()
    request_intervention.customer_id = params[:Customer]
    request_intervention.save()
  end

 




def get_building_by_customer
  @building = Building.where("customer_id = ?", params[:customer_id])
  respond_with(@building)
  end

  def get_baterry_by_building
    @baterry = Baterry.where("building_id = ?", params[:building_id])
    respond_with(@baterry)
    end

end
